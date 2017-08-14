import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneLayout;

import jess.JessException;
import jess.QueryResult;
import jess.ValueVector;



public class Template extends JFrame implements ActionListener{
	
	private static final long serialVersionUID = 1L;
	
	JLabel [] label = new JLabel [10];
	JTextArea [] txt = new JTextArea [10];
	JButton close = new JButton("Close");
	String []kata = new String[10];
	JScrollPane pane = new JScrollPane();
	JPanel pane2 = new JPanel();
	Vector <String> name = new Vector<String>(); 
	Vector <String> color = new Vector<String>(); 
	Vector <String> size = new Vector<String>(); 
	
	public Template(){
		
		kata[0] = "Name";
		kata[1] = "Color";
		kata[2] = "Size";
		
		
		setTitle("List of clothes");
		setSize(300, 200);
		pane.setLayout(new ScrollPaneLayout());
		pane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		pane2.setLayout(new GridLayout(2, 3));

		for(int i=0;i<3;i++)
		{
			txt[i] = new JTextArea();
			txt[i].setLineWrap(true);
			txt[i].setWrapStyleWord(true);
			txt[i].setEditable(false);
			txt[i].setAlignmentX(CENTER_ALIGNMENT);
			label[i] = new JLabel("",JLabel.LEFT);
			label[i].setText(kata[i]);
			pane2.add(label[i]);
		}
		
		
		//Code in here
		try {
			QueryResult result = Main.objRete.runQueryStar("getCloth", new ValueVector());
			
			while (result.next()) {
				name.add(result.getString("n"));
				color.add(result.getString("c"));
				size.add(result.getString("s"));
			}
			
			for (int i = 0; i <= name.size(); i++) {
				if (i == 0) {
					txt[0].append("name");
					txt[1].append("color");
					txt[2].append("size");
				} else {
					txt[0].append("\n" + name.get(i-1));
					txt[1].append("\n" + color.get(i-1));
					txt[2].append("\n" + size.get(i-1));
				}
			}
			
		} catch (JessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i=0;i<3;i++)
		{
			pane2.add(txt[i]);
		}
		add(pane);
		pane.getViewport().add(pane2);
		add(close,"South");
		close.addActionListener(this);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setVisible(true);
		
	}

	public void actionPerformed(ActionEvent arg0) {
		if(arg0.getSource()==close)
			this.dispose();
	}
	
}
