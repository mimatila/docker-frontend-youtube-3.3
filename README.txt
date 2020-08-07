Harjoitus 3.3 idea:

- Käytetään Github repositorya, CircleCItä ja DockerHubia.
- Ekana luodaan Githubin Dockerfilestä frontend image johon on asennettu docker cli ja lisätty hakemisto youtube, jossa on sen Dockerfile.
- Kun käynnistetään docker-frontend-youtube-3.3 ohjelma watchtowerin kanssa. Samalla Buildataan
komennoilla youtube image kontissa(docker build -t youtube-dl .) ja ajetaan se(docker run youtube-dl https://imgur.com/JY5tHqr).

Image on talletettu Dockerhubiin ja CircleCI valvoo muutoksia Githubista. Muutosta pollataan
5 minuutin välein watchtowerin puolesta ja kontti päivitetään.

https://github.com/mimatila/docker-frontend-youtube-3.3

config.yml:

version: "3"
services:
  frontend:
    image: mimatila/docker-frontend-youtube-3.3
    volumes:        
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 5000:5000
    container_name: frontend
  watchtower:
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    container_name: watchtower
