Harjoitus 3.3:

- Käytetään Github reposotorya, CircleCItä ja DockerHubia.
- Ekana luodaan Dockerfilestä frontend image johon lisätty hakemisto youtube, jossa on sen Dockerfile.
- Kun käynnistetään docker-frontend-youtube-3.3 ohjelma watchtowerin kanssa. Buildataan
manuaalisesti youtube image kontissa ja ajetaan se.

Image on talletettu Dockerhubiin ja CircleCI valvoo muutoksia Githubista. Muutosta pollataan
5 minuutin välein ja kontti päivitetään.
