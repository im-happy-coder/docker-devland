![docker-devland](./img/docker-dev-land.jpg)

# Overview

Docker를 활용하여 개발에 환경 구축에 필요한 시스템을 컨테이너화하고

docker-compose를 이용하여 각 컨테이너들을 관리하여

쉽고 빠르게 개발환경을 구성할 수 있고

동일한 개발환경을 똑같이 구성할 수 있다.

[https://github.com/im-happy-coder/docker-devland-application](https://github.com/im-happy-coder/docker-devland-application)

## Technologies used

- 웹서버와 WAS 연결
  - httpd(apache) + tomcat(was) modJK Connector
- WAS와 DB 연결
  - Tomcat GlobalNamingResources 기능을 사용하여 <br/>
  JNDI(Java Naming Directory Interface) Mysql Oracle 연결
- SpringBoot
  - Chanedtransaction 이용하여 서로 다른 DB통신
  - SpringBoot Redis 이용한 DB의 Object Cache 저장
- JMX(Java Management Extensions) 이용하여 WAS 모니터링
- WAS1, WAS2 Session Clustering

## Enviroment

> CentOS 7
>
> Docker version 20.10.16
> 
> docker-compose version 1.24.0
>
> Spring Boot 1.4.5
> 
> JDK 1.8.0_201
>
> MAVEN 3.6.1

## Directory Structure

```shell
.
├── compose.sh
├── docker
│   ├── docker-compose-gitlab.yml
│   ├── docker-compose-httpd.yml
│   ├── docker-compose-jenkins.yml
│   ├── docker-compose-mysql.yml
│   ├── docker-compose-oracle11g.yml
│   ├── docker-compose-redis.yml
│   └── docker-compose-tomcat.yml
├── httpd
│   ├── build
│   ├── conf
│   └── conf.d
├── img
│   ├── composeDown.PNG
│   └── composeUp.PNG
├── jenkins
│   └── build
├── mode.sh
├── README.md
└── tomcat
    ├── build1
    ├── build2
    ├── conf1
    ├── conf2
    ├── target1
    └── target2

```

---

### Description below

- https://grateful-eye-0c3.notion.site/index-d66caf20989f4336a8e430f4b380101f?pvs=4
