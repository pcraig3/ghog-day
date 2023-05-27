<div align="center">
  <img alt="Logo" src="./public/apple-touch-icon.png" width="100" />
  <h1>GROUNDHOG-DAY.com</h1>
  <p><em>It's a real holiday.</em></p>
</div>

## About

GROUNDHOG-DAY.com is the leading data source for North America’s prognosticating groundhogs and their yearly predictions. It's a fun little [express](https://expressjs.com) app with a frontend you can browse and an API you can use. Historical Groundhog Day data is collected from a variety of sources, including [an academic paper](https://journals.ametsoc.org/view/journals/wcas/13/3/WCAS-D-20-0171.1.xml).

- The frontend is pretty straightforward: nunjucks and sass and JS only when I have to.
- The API does what APIs do: serves resources in JSON. It's free, fast, and simple.

There's kind of an interesting concept here: the data is basically static and it's all about `GET`s. To make it cheap, fast, and easy, there's one container with an in-memory DB that is seeded when the container boots up on deploy. Super easy to work on and cheap to run, even with 100s of thousands of hits a month.

## Using the API

Please get in touch if you are using the API and you need something, because I can probably make it work better if I have enough real-life use-cases.

[Read more on the API](https://groundhog-day.com/api).

There's an OpenAPI spec at [`Groundhog-Day-API.v1.yaml`](https://github.com/pcraig3/ghog-day/blob/main/reference/Groundhog-Day-API.v1.yaml) and a <a href="https://app.swaggerhub.com/apis/pcraig3/groundhog-day-api" target="_blank">SwaggerHub</a> page where you can test the endpoints.

## Getting started

### [Install `npm`](https://www.npmjs.com/get-npm)

`npm` is a javascript package manager. It downloads project dependencies and runs node applications.

You'll need node version `v14` or higher to run the app. (If you have an M1 Mac, you'll need `v15` or higher.)

### [Install `docker`](https://docs.docker.com/install/)

A docker container allows a developer to package up an application and all of its parts. This means we can build an app in any language, in any stack, and then run it anywhere — whether locally or on a server.

## Build and run with npm

Just install the dependencies and run it. Pretty slick. 😎

```bash
# install dependencies
npm install

# run application in 'dev' mode
# (ie, the server restarts when you save a file)
npm run dev

# run application in 'prod' mode
npm start
```

The app should be running at [http://localhost:3000/](http://localhost:3000/).

On a Mac, press `Control` + `C` to quit the running application.

### Run tests with npm

```bash
# run unit tests
npm test

# run linting
npm run lint
```

#### unit tests

The unit tests are pretty straightforward. I'm using [`supertest`](https://www.npmjs.com/package/supertest) to make requests and then [`cheerio`](https://cheerio.js.org/) to load + parse the responses and then we can make assertions against them. Using [`cheerio`](https://cheerio.js.org/), we can load in a string like `"<main><p>hello</p></main>"` and then traverse it using jQuery selector syntax. So we can write assertions against stuff like `$('main > p').text()`, which is far better than string equality-type stuff.

There's not so many tests at the minute, but [I am getting an A+ on LGTM](https://lgtm.com/projects/g/pcraig3/ghog-day/) which — dear reader — is the highest possible mark.

## Build and run as a Docker container

```sh
# build an image locally
docker build -t pcraig3/ghog:<tag> --build-arg GITHUB_SHA_ARG=<tag> .

# run the container
docker run -it -p 3000:3000 pcraig3/ghog:<tag>
```

The container should be running at http://localhost:3000/.

On a Mac, press Control + C to quit the running docker container.

### Push to Cloud Run

The [`main.yaml`](https://github.com/pcraig3/ghog-day/blob/main/.github/workflows/main.yml) file contains instructions to deploy the service to [Cloud Run](https://cloud.google.com/run), or you can use the CLI command below to do it manually.

```
gcloud run deploy {SERVICE} --project {PROJECT} --image gcr.io/can-hols/hols:{TAG}
```
