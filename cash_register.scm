; Joseph Seder and Daniel Gritters
; Basic pos system to keep a running total.
; User enters amounts to add to a running total.
; The final total with tax is calculated and printed
; out when user enters 0.
(define (start-pos) 
	; Print starting info
	(display "Scheme Point-of-Sale")
	(newline)
	(display "Start transaction (exit with 0): ")
	(newline)
	; Start pos program
	(let ((tax_rate 0.065)(subtot (checkOut -1 0)))
		; Print subtotal, tax, and total
		(newline)
		(display (string-append "Subtotal: $" (number->string subtot)))
		(newline)
		(display (string-append "Tax: $" (number->string(* subtot tax_rate))))
		(newline)
		(display (string-append "Total: $" (number->string(+ subtot (* subtot tax_rate)))))
	)
)

; Function to display running total and prompt user for additional input
(define (checkOut value subtotal)
	(newline)
	; Exit when user enters 0 as value
	(if (eq? value 0)
		; Return subtotal when user enters 0
		subtotal 
		; Prompt user for input, print subtotal, and recursively display subtotal
		(begin
			(display "Enter value: $")
			(let ((x (read)))
				(display (string-append "$" (number->string (+ x subtotal))))
				(checkOut x (+ x subtotal)))
		) 
	)
)
