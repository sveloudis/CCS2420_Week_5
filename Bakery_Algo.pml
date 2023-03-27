# define N 2
bool choosing[N] = false;
bool inCritical[N] = false;
byte num[N];
//byte nr_pro;

active [N] proctype P() {
	byte h, j, i;
    	do
    	:: true ->
        	choosing[_pid] = true;
        	h = 0;
        	i = 0;
       	 	do
        	:: i > N-1 -> break
        	:: else ->
            		if 
			:: h < num[i] -> h = num[i];
            		:: else -> skip;
            		fi;
            		i = i+1;
        	od;
        	num[_pid] = 1 + h;
        	choosing[_pid] = false;
        	j = 0;
        	do
        	:: j > N-1 -> break
        	:: else ->
            		if 
			:: j != _pid -> 
				choosing[j] == false;
                		(num[j] == 0) || (num[_pid] < num[j]) || ((num[_pid] == num[j]) && (_pid < j))
            		:: else -> skip;
            		fi;
            		j = j+1;
        	od;
        	atomic {
            		//nr_pro++;
            		//assert (nr_pro == 1);
	    		inCritical[_pid] = true;
            		//nr_pro--;
        	}
  		inCritical[_pid] = false;
		num[_pid] = 0;
    	od;
}										
