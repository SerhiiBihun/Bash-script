#! /bin/bash

help(){
   echo  -e "you have to use: \n--first_name - for user's name\n--second_name - for user's last name\n--date - for date (yyyy-mm-dd)\n--age - how many yars of user\n--city - for user's city\n--mail - user's email"
}
 
 while [[ $# > 1 ]]
    do
        par="$1"
        case $par in
            --first_name)
                first_name="$2"
            shift
            ;;
            --second_name)
                second_name="$2"
            shift
            ;;
            --date)
                date="$2"
            shift
            ;;
             --age)
                age="$2"
            shift
            ;;
             --city)
                city="$2"
            shift
            ;;
            --mail)
                mail="$2"
            shift
            ;;
           *)
           echo -e "Bad parametr $1 \nyou have to use: --help"
           exit 1
           ;;
        esac
        shift
    done

if [ -z $first_name ];
    then
        echo "Error: first name NOT exist" 
        help;
        exit 1
fi

if [ -z $second_name ];
    then
        echo "Error: second name NOT exist"
        help;
        exit 1
fi

if [ -z $date ];
    then
        echo "Error: data NOT exist"
        help;
        exit 1
fi

if [ -z $age ];
    then
        echo "Error: age NOT exist"
        help;
        exit 1
fi

if [ -z $city ];
    then
        echo "Error: city NOT exist"
        help;
        exit 1
fi

if [ -z $mail ];
    then
        echo "Error: mail NOT exist"
        help;
        exit 1
fi

setUpuser(){
    if [[ $first_name =~ ^[a-Z]+$ ]];
        then
            echo "Name valid"
        else
            echo "Error: name invalid"
            exit 1
    fi

    if [[ $second_name =~ ^[a-Z]+$ ]];
        then
             echo "Last name valid"
        else
             echo "Error: last name invalid"
             exit 1
    fi
    
    if [[ $date =~ ^[1-2][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9] ]];
        then
            echo "Date valid"
        else
            echo "Date invalid"
            exit 1
    fi
    
    if [[ $age =~ ^[1-9][0-9] ]];
        then
            echo "Age valid"
        else
            echo "Age invalid"
            exit 1
    fi

    if [[ $city =~ ^[a-Z]+$ ]];
        then
            echo "City valid"
        else
            echo "Error: City invalid"
            exit 1
    fi

    if echo "${mail}" | grep '^[a-Z0-9_-]*@[a-Z0-9]*\.[a-z]*$' >/dev/null;
        then
            echo "Adress $mail  valid"
        else
            echo "Adress $mail invalid"
            exit 1
    fi
    echo "User $first_name exist"
    echo "$first_name   $second_name   $age   $date   $city  $mail" >> ./user_base.txt
}

setUpuser;