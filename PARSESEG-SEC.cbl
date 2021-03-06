       Identification division.                                                 
       Program-id. PARSESEG-PAR.                                                    
       Environment division.                                                    
       Input-output section.                                                    
       File-control.                                                            
           Select Input-XML                                                     
            Assign to infile                                                   
            File status is Input-XML-status.                                   
       Data division.                                                           
       File section.                                                            
       FD Input-XML                                                             
           Record is varying from 1 to 255 depending on Rec-length              
           Recording mode V.                                                    
       1 fdrec.                                                                 
         2 pic X occurs 1 to 255 depending on Rec-length .                      
       Working-storage section.                                                 
       1 Event-number comp pic 99.                                              
       1 Rec-length comp-5 pic 9(4).                                            
       1 Input-XML-status pic 99.                                               
       Procedure division.                                                      
           Open input Input-XML                                                 
           If Input-XML-status not = 0                                          
             Display 'Open failed, file status: '  Input-XML-status             
             Goback                                                             
           End-if                                                               
           Read Input-XML                                                       
           If Input-XML-status not = 0                                          
             Display 'Read failed, file status: '  Input-XML-status             
             Goback                                                             
           End-if                                                               
           Move 0 to Event-number                                               
           Display 'Starting with: ' fdrec                                     
           Display 'Event number and name    Content of XML-text'               
           XML parse fdrec processing procedure Handle-parse-events-sec             
           Close Input-XML                                                      
           Goback                                                               
           .                                    
       Handle-parse-events-sec Section.
	   Handle-parse-events-par.
           Add 1 to Event-number                                                
           Display '  ' Event-number ': ' XML-event '{' XML-text '}'            
           Evaluate XML-event                                                   
             When 'END-OF-INPUT'                                                
               Read Input-XML                                                   
               Evaluate Input-XML-status                                        
                 When 0                                                         
                   Move 1 to XML-code                                           
                   Display 'Continuing with: ' fdrec                            
                 When 10                                                        
                   Display 'At EOF; no more input.'                             
                 When other                                                     
                   Display 'Read failed, file status:' Input-XML-status         
                   Goback                                                       
               End-evaluate                                                     
             When other                                                         
               Continue                                                         
           End-evaluate                                                         
                .                                                                    
       End program PARSESEG-PAR. 