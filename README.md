Infix-Postfix-Evaluation
========================

This Project converts infix expressions to postfix and evaluates postfix expressions!

Operations class include below useful functions:

<b>1)  checkTheEvaluation(String) -> Bool</b><br>
<tab>      checking the evaluation if there is a syntax error. For instance bracket and number control.<br>
      (A+B)+C   returns true<br>
      (A+B)+C)  returns false - bracket mistake<br>
      (AB+C)*D  returns false - number mistake<br>
    
<b>2)  infixToPostfixEvaluation(String) -> String</b><br>
      evaluate the infix string equation to postfix equation.<br>

<b>3)  postfixEvaluate(String) ->Double</b><br>
      returns result of postfix equation.<br>
