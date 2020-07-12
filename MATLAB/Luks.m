s = serial('COM5');
fopen(s);
 while(1)
    out = fread(s,1);
    if out == 37
        
        val = str2double(char(fscanf(s,'%s', 4)));
        val2 = str2double(char(fscanf(s,'%s', 4)));
        
        if val == 1
            tk = 2856;
            if(val2<=2)
                Lu = 2.7928*val2^3 - 3.8153*val2^2 + 8.2929*val2 + 0.0004;
            elseif(val2>2 && val2<=4.19)
                Lu = 17.211*val2^4 - 126.5*val2^3 + 309.02*val2^2 - 232.73*val2 + 0.4953; 
            elseif(val2>4.19 && val2<4.68) 
                Lu = (8*10^(-6))*2.71828182846^(4.2002*val2); 
            else
                Lu = 9*10^(-38)*val2^(60.09);
            end
            
        elseif val == 2
            tk = 4000;
            if(val2<=3.13)
               Lu = 10.534*val2^2 - 5.0868*val2 + 1.1817; 
            elseif(val2>3.13 && val2<=4.25) 
               Lu = 0.612*2.71828182846^(1.6381*val2);
            elseif(val2>4.25 && val2<=4.73) 
                Lu = (3*10^(-6))*2.71828182846^(4.4857*val2);
            else
                Lu = (2*10^(-25))*2.71828182846^(13.715*val2);
            end
            
        elseif val == 3
            tk = 6500;
            if(val2<=4) 
                Lu = 2.0079*2.71828182846^(1.272*val2);
            elseif(val2>4 && val2<=4.55)
               Lu = 182.14*val2^5 - 2526.3*val2^4 + 13614*val2^3 - 35460*val2^2 + 44512*val2 - 21486;
            elseif(val2>4.55 && val2<=4.82) 
                Lu = (1*10^(-12))*2.71828182846^(7.6535*val2); 
            else
                Lu = (3*10^(-44))*val2^(69.58);
            end
            
        else
            tk = 0;
            Lu = 0;
        end
        
        disp(['Temperatura oko³o: ', int2str(tk), ' K    Luksy: ' , int2str(Lu) ,'     Napiêcie: ', num2str(val2)])
            
    elseif out ==38
        disp('Koniec pomiarów')
        break
    end
 end
fclose(s);
delete(s)
clear s