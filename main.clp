(deftemplate BAJU
    (slot name)
    (slot color)
    (slot size)
)

(defglobal ?*jml* = 1)
(defglobal ?*flag* = FALSE)

(deffunction runTemplate ()
	(new Template)
)


(defquery getCloth
	(BAJU (name ?n) (color ?c) (size ?s))
)

(reset)
(assert (BAJU (name "Sispak") (color "red") (size "xl")))
(bind ?pil 0)

(while (neq ?pil 5)
	(printout t "=-=-=-=-=-=-=-=-=-=-=-=-=" crlf)
    (printout t "= Bluejack clothes Store=" crlf)
    (printout t "=-=-=-=-=-=-=-=-=-=-=-=-=" crlf)
	(printout t "1. Add new clothes" crlf)
	(printout t "2. Modify clothes" crlf)
	(printout t "3. Sell clothes" crlf)
    (printout t "4. View clothes" crlf)
    (printout t "5. Exit" crlf)
    (bind ?pil 0)
    (while (or (< ?pil 1) (> ?pil 5)  )
	    (printout t "Input your choice : ")
		(bind ?pil (read))
        (if (eq (numberp ?pil) FALSE) then (bind ?pil -1))
    )
    
    (
    if(eq ?pil 1) then
        (printout t crlf crlf "=================" crlf)
        (printout t "=Add new dress  =" crlf)
        (printout t "=================" crlf)        
        
        (bind ?name "")
	    (while  (or (< (str-length ?name) 5 ) (> (str-length ?name) 10 ))
	        (printout t "Enter the dress name [5-10]: " )
	        (bind ?name (readline))
	    )
        
       (bind ?color "")
	   (while  (and (neq (lowcase ?color) "red") (neq (lowcase ?color) "black") (neq (lowcase ?color) "blue"))
	        (printout t "Enter the dress color [red|black|blue]: " )
	        (bind ?color (readline))
	   )
        
       (bind ?size "")
	   (while  (and (neq (lowcase ?size) "s") (neq (lowcase ?size) "m") (neq (lowcase ?size) "l") (neq (lowcase ?size) "xl"))
	        (printout t "Enter the dress size [s|m|l|xl]: " )
	        (bind ?size (readline))
	   )
        
        (assert (BAJU (name ?name) (color ?color) (size ?size)))
        (bind ?*jml* (+ ?*jml* 1))
        (printout t "Press enter to continue..." crlf)
        (readline)
        
    elif (eq ?pil 2) then
        
        (printout t crlf crlf "=================" crlf)
        (printout t "=list of clothes=" crlf)
        (printout t "=================" crlf)
        (facts)
        
        (bind ?num -1)          
        (while (eq ?num -1)
        	(printout t "Enter fact number [0-" ?*jml* "] : ")
        	(bind ?num (read))
            (
                if (eq (numberp ?num) FALSE) 
                then (bind ?num -1)
            )
        )
                    
        (try 
            (bind ?*flag* FALSE)
         	(modify ?num (name "") (color "") (size ""))
        catch 
            (bind ?*flag* TRUE)
            (printout t "No such fact..." crlf)
        )
        
       (if (eq ?*flag* FALSE) then 
            (bind ?name "")
			(while  (or (< (str-length ?name) 5 ) (> (str-length ?name) 10 ))
		        (printout t "Enter the dress name [5-10]: " )
		        (bind ?name (readline))
	  	    )
		        
	        (bind ?color "")
		    (while  (and (neq (lowcase ?color) "red") (neq (lowcase ?color) "black") (neq (lowcase ?color) "blue"))
		        (printout t "Enter the dress color [red|black|blue]: " )
		        (bind ?color (readline))
		    )
		        
		    (bind ?size "")
		    (while  (and (neq (lowcase ?size) "s") (neq (lowcase ?size) "m") (neq (lowcase ?size) "l") (neq (lowcase ?size) "xl"))
		        (printout t "Enter the dress size [s|m|l|xl]: " )
		        (bind ?size (readline))
	   		)
            (modify ?num (name ?name) (color ?color) (size ?size))
            (printout t "Success Modify such fact..." crlf)
       )       

       (printout t "Press enter to continue..." crlf)
       (readline)
        
    elif (eq ?pil 3) then    
        (printout t crlf crlf "=================" crlf)
        (printout t "=list of clothes=" crlf)
        (printout t "=================" crlf)
        (facts)
        
        (bind ?num -1)  
        
        (while (eq ?num -1)
        	(printout t "Enter fact number : ")
        	(bind ?num (read))
            (
                if (eq (numberp ?num) FALSE) 
                then (bind ?num -1)
            )
        )
        
        (bind ?flag (retract ?num))
        
        (
        if (eq ?flag FALSE) then (printout t "No Such Fact exist " )
        else
           (printout t "Success delete such Fact" crlf)
       	)
        (printout t "Press enter to continue..." crlf)
        (readline)
        
    elif (eq ?pil 4) then  
        (printout t crlf "View dress list" crlf)
        (printout t "===============" crlf)
        ;(facts)
        (runTemplate)
        (printout t "Press enter to continue..." crlf)
        (readline)
    )
    
)