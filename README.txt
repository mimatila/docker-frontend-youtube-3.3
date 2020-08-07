Harjoitus 3.3:

- Käytetään Github repositorya, CircleCItä ja DockerHubia.
- Ekana luodaan Githubin Dockerfilestä frontend image johon on asennettu docker cli ja lisätty hakemisto youtube, jossa on sen Dockerfile.
- Kun käynnistetään docker-frontend-youtube-3.3 ohjelma watchtowerin kanssa. Buildataan
manuaalisesti youtube image kontissa(docker build -t youtube-dl .) ja ajetaan se(docker run youtube-dl https://imgur.com/JY5tHqr).

Image on talletettu Dockerhubiin ja CircleCI valvoo muutoksia Githubista. Muutosta pollataan
5 minuutin välein watchtowerin puolesta ja kontti päivitetään.
