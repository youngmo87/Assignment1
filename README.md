# Docker-Oracle
## 1. Docker 에서 오라클을 어떻게 설치 할 것인가?
도커에서 오라클을 설치 하기 위해서는 3가지의 과정이 필요하다. 1. search, 2. pull, 3. run
Docker quick terminal 을 실행하고 Oracle을 찾기위해서  
첫번째는      
>**docker search oracle** 


을 입력
입력뒤에 터미널에 뜨는 내용은 인기도 순 그리고 공식적인 것인지에 관한 것이 등장한다.  
자신이 찾고 있는 버전을 찾았다면 명령어 **pull**을 이용한다.
예를 들자면 내가 찾은 파일은 **sath89/oracle-xe-11g** 라고 했을때 이미지를 받기위해서는  
>**docker pull sath89/oracle-xe-11g**       


를 터미널 창에 입력한다.      
**pull**받은 이미지를 확인하기 위해서는 **docker images** 혹은 **docekr image ls** 입력하면 확인할 수 있다.     
받은 이미지를 구동, 즉 컨테이너를 생성하기 위해서는 다음과 같은 명령어가 필요하다.   
>**docker run -d --name oracle -p 8080:8080 -p 1521:1521 sath/orcle-xe-11g**        


여기서 **run**은 컨테이너를 실행한다는 것이고 **-d**는 백그라운도로 실행 명령어 **--name**은 자신이 지정하고 싶은 컨테이너의 이름을 설정하는것이다.    
**-p**라는 명령어는 **포트**를 의미한다. 앞의 포트는 자신의 포트이고 뒤의 포트는 연결할 포트번호이다. 즉 위의 명령어에서는 8080포트를 8080포트와 연결시키고 1521포트를 1521 포트와 연결시키는 것을 의미한다.    
이 과정을 거치게 되면 컨테이너가 생성되고, 생성된 컨테이너를 실행하기위해서는 터미널 창에 다음과 같은 명령어가 필요하다.      
>**docker exec -it oracle bash**


제대로 설치가 되었다면 터미널 창에는 **root**로 시작하는 커맨더가 보이게 된다. 이 과정까지 왔다면 도커를 통해서 Oracle설치를 완료한 것이다.  
컨테이너를 생성한 후에, 실행여부를 알고 싶다면  
>**docker ps**를 입력 


기존의 생성된 이미지와 구동된 컨테이너의 기록을 보고싶다면 
>**docker ps -a**를 입력하면 된다. 


## 2. Docker를 활용하여 MySQL 5.7을 어떻게 설치할 것인가?   
첫번째는, 도커를 실행한 커맨더 창에  
**docker search mysql**을 입력한다. 자신이 원하는 버전을 찾았다면 커맨더 창에는
**Docker pull "원하는버전"** 을 입력하게 되면 이미지를 다운 받을 수 있다.  
예를 들어, 자신의 원하는 mysql의 버전이 최신버진이라면 
**docker pull mysql:latest 혹은 특정 버전 즉, mysql:5.7**을 입력하면 그것과 관련되 이미지를 다운받을 수 있다.  
다운로드가 끝나면 **docker images 혹은 docker image -ls**를 통해 이미지 목록을 확인할 수 있고, 내려받은 이미지를 컨테이너로 구동시키고자 한다면  
**docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD='자신의 초기암호' --name mysql5 mysql:5.7**을 입력한다. 
이 명령어가 의미하는 것은 컨테이너를 백그라운도로 실행하고 포트는 3306으로 맞추고 **mysql** 실행시 필요한 비밀번호는 자신이 입력한 암호이며 --name 이후롤 등장하는 것은 자신이 설정한 컨테이너의 이름이 되고, 마지막은 **mysql:5.7** 이미지로 부터 컨테이너를 실행한다는 것을 의미한다. 
컨테이너를 실행하기위해서는 다음과 같은 명령어가 필요하다. 
**docker exec -it mysql5 bash** 
위의 명령어를 통해 컨터이너를 실제적으로 실행을 하게 되면 **root**로 시작하는 커맨더 창이 나타난다.  
그 이후에,  
>mysql -u root -p

를 입력하게 되면 위에서 입력했던 **자신의 초기암호**를 물어보는 커맨더 창이 나타나고, 
암호를 입력하면 **mysql>** 이라는 커맨더 창이 생성됨으로써 MySQL의 설치를 완료하게 되는 것이다.   

## 3. 오라클과 MySQL에서 사용자를 어떻게 생성 할 것인가?   
오라클을 구동하기 위해서는 먼저 도커창에서 오라클을 실행한뒤에 **sqlplus**를 입력, 입력한뒤에는 ID 와 비밀번호를 물어보는 커맨더가 등장하는데,  
초기값은 ID에 **system** 암호는 **oracle** 을 입력한다. 
오라클은 **system**과 더불어 hr 이라는 사용자를 기본으로 갖는데,  alter user hr identified by "암호" account unlock 이라는 명령으를 입력하면 hr 사용자의 암호를 설정해 연결 할 수 있다. 
이러한 시범 과정을 거친뒤에 SQL Developer을 다운 받고 수동으로 접속생성이라는 걸 통해 name에 system 비번은 oracle을 설정하고 테스트를 입력하고 성공하면 연결된 것이다. 여기서 사용자를 생성하고 싶다면 자신의 접속한 아이디를 클릭 다른 사용자 생성창에서 우클릭 사용자 생성을 하면 또 다른 사용자가 생성되고 권한을 어떻게 부여할지 선택할 수 있다. 

MySQL은 도커에서 기존의 받은 이미지를 통해 생성된 컨네이너를 구동함으로써 사용자 생성 과정이 시작된다. 처음에 root의 권한으로 MySQL을 실행하려면   **mysql -u root -p** 를 커맨더창에 입력하면 **mysql>** 이라는 커맨더 창으로 뜨게 된다.    **mysql>** 상태에서 사용자를 생성하려면 다음과 같은 명령어가 필요하다.    
>create user <user-name>@'<host>' identified by "사용자암호";  

를 입력하면 사용자가 생성된것이다. 
예를 들자면, **dooo** 라는 계정을 MySQL 추가 할 경우, 명령어
>create user dooo@'%' identified by "암호"; 

를 입력할시 **dooo**라는 유저가 생성된다. 

## 4. Docker의 개념을 어떻게 이해 할 것인가?
도커가 등장하기이전에는 개발, stage, real, 배포, DB 서버등 여러대의 서버를 갖추고 운영하는 환경이었다면, 도커가 등장함으로써 하나의 서버(클라우드기반)를 하나의 서버에서 위에서의 열거한 여러대의 서버기능을 수행 할 수 있게 된다. 예를 들면, 윈도우에서 리눅스를 이용하고자 한다면 가상머신의 필요한데, 이러한 가상머신의 운영은 컴퓨터에 무리를 줄 수밖에 없다. 이에 반해, 도커를 이용한다면 특히 window 10 이상의 버전에서는 도커를 통해 받은 이미지들을 이용해 컨테이너를 구동함으로써 마치 각각의 컨테이너들이 개별 서버로써 역활을 수행 할 수 있게 되는 것이다.    

window 10 보다 버전이 낮다면 도커를 구동하기위해서는 **Vitual Toolbox**가 필요하다. 이 **Vitual Toolbox** 를 dockemachine의 한 종류라고 볼 수 있다. **Vitual Toolbox** 를 쓸때는 **Vitual Toolbox**와 **Window** 그리고 **Docker**를 연결 시키기 위해서는 일련의 과정이 필요한데, 그것은 설정의 네트워크 그리고 **포트포워딩** 을 통해 게스트와 호스트 포트를 같게끔 맞출 필요가 있다.   

Docker를 설치함에 있어서는 **Docker Store**에서 다운받은 설치파일을 실행하고, 설치가 완료되면 **Quick start terminal** 이라는 바로가기가 생성되게 된다.    

**Quick start terminal**을 실행하고 잠시기다리면 고래이미지와 함께 커맨더 창이 등장하게 되는데, 이 경우가 제대로 **Quick start terminal**에 보인다면 **Docker**설치가 완료된 것이다. 그 이후에는, 도커에서 이미지를 찾고, 찾은 이미지를 **pull** 한 다음에 이미지를 컨테이너로 구동함으로써 하나의 서버로써 역활을 할 수 있게끔 해주는 것이다. 

**Docker**를 활용했을 때의 한가지 이점을 첨언하자면, 서버로써 역활을 하는 **Docker**를 통해 클라이언트에 한번에 배포할 수 있을뿐더러 유지보수에도 강점이 있다. 예를 들자면, **start**와 **stop**을 통해 서버를 reboot한다는 개념을 적용 시킬수 있게끔 되는 것이다. 

## 5. Docker를 통해 리눅스(ubuntu)를 어떻게 설치할 것인가?
**Docker** 창에서 search 기능을 이용하여 **ubuntu**를 찾고 pull, run, 그리고 attach 혹은 exec 명령어를 통해 ubuntu를 실행 할 수 있게 된다.
이미지를 다운 받은뒤의 컨테이너 구동시의 명령어는 다음과 같다. 
>docker run -itd -name ubx ubuntu bash    

여기서 텔넷을 설정하려면 **root** 기반에서 **apt-get update**를 입력한 후에 **apt-get install xinetd telneted** 를 수행하게 되면 텔넷을 이용할 수 있게 된다. 텔넷의 초기값은 VI 에디터를 통해 telnet을 실행하고 다음과 같은 명령어를 추가한다.  

>service telnet
{
    disable = no
    flags = REUSE
    socket_type = stream
    wait = no
    user = root
    server = /usr/sbin/in.telnetd
    log_on_failure += USERID
}


입력후 텔넷의 재시작은 명령어  **/etc/init.d/xinetd restart**를 입력함으로써 수행 할 수 있다. VI 에디터를 통해 수정된 우분투를 하나의 이미지로 도커에서 commit한다. 그 이유는 텔넷을 위해 입력했던 명령어들을 다음수행시 그대로 쓸 수 있게끔 하기에 이러한 과정을 거친다. 명령어를 예로 들자면 다음과 같다. 

>docker run -itd -p 23:23 --name ubt ub-telnet bash

이것을 입력한뒤에 putty를 이용하면 이미지로 저장된 컨테이너속에 수정한 사항이 저장되어 있기에 **putty**를 통해 접속을 하면 텔넷을 이용할 수 있게된다. 그러나 컨테이너의 종료 혹은 일련의 어떤 과정속에 나갔다가 다시 들어오는 과정을 거치게 된다면 텔넷의 접속은 끊길 수도 있다. 이것을 대비하여 
>/bin/docker_bash 라는 파일을 VI 에디터를 통해 부른뒤에 
#!/bin/sh
/etc/init.d/xinetd restart
export LANGUAGE=ko
LC_ALL=ko_KR.UTF-8 bash
#> chmod +x /bin/docker_bash


나온뒤 이것을 저장하고 있는 또다른 이미지를 도커상에서 commit 하고 그 이미지를 내려받고 컨테이너 구동을 위한 명령어를 다음과 같이 한다면 접속 끊김을 방지할 수 있다. 
> docker run -itd --restart=always --name ubx -p 23:23 ubx /bin/docker_bash


이 과정이 끝나고 제대로 수행이 된다면 기존의 우분투 컨테이너와 이미지들을 삭제해도 된다. 한가지 추가할 것은 chmod를 통해 실행 권한을 주어야한다.

리눅스 커맨드창에서 특정사용자가 그 계정으로 putty 와 VI 에디터에서 한글을 이용하고자 한다면 **locale**이라는 명령어를 통해 현재언어를 확인하고 **locale -a** 라는 명령어를 통해 적용가능한 언어목록을 확인 한뒤에 **apt-get install locales** 를 커맨더 창에 입력한다.   
설치가 끝나면 그 계정의 **profile**을 VI 에디터로 열어 다음과 같은 명령어를 입력한다. 

>export LANGUAGE=ko
LC_ALL=ko_KR.UTF-8 bash


앞에 텔넷 설정에서 추가된 위의 명령어가 의미하는 것은 root 계정으로 하여금 컨테이너가 구동될 대 마다 한국어를 사용할 수 있다는 것으로 해석 될 수 있다. 이러한 정보를 저장한 이미지를 만들고 컨테이너를 구동하였기에 putty나 VI에디터 상에서 한글을 쓸 수 있게 되는 것이다. 

도커에서 **GIT**을 사용하려면 사용자계정의 리눅스 커맨드에서 
> apt-get install git 

을 입력한후 
>it config --global user.name <github-username>
git config --global user.email <email>
  
를 통해 설정을 하게 된다. git의 기능을 이용함에 있어 사용자 아이디와 비밀번호를 물어보게 되는데 이러한 과정을 건너뛰고 싶다면,    
>git config credential.helper store

를 통해 설정을 한다. 그리고 git에서 만든 repository의 주소를 입력을 통해 clone를 한다면 리눅스상에서 git을 이용할 준비를 마친것이라 할 수있다. 
