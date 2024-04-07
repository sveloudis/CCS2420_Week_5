# define N 2
bool choosing[N];
int num[N];
bool inCr[N]

active [N] proctype P() {
	byte h, j, i;
    	do
    	:: true ->
		//issue ticket - start
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
		//issue ticket - end
        	j = 0;
		//access control:
        	do
        	:: j > N-1 -> break
        	:: else ->
            		if 
			:: j != _pid -> choosing[j] == false;
                           (num[j] == 0) || (num[_pid] < num[j]) || ((num[_pid] == num[j]) && (_pid < j))
            		:: else -> skip;
            		fi;
            		j = j+1;
        	od;
		//Critical section - start
		inCr[_pid] = 1;
		inCr[_pid] = 0;
		//Critcal section - end
		num[_pid] = 0;
    	od;
}										
ltl p1 { [] ( ( inCr[0] -> !inCr[1] ) && ( inCr[0] -> !inCr[1] ) ) }

