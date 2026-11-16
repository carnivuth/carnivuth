FROM hugomods/hugo:dart-sass-0.165.0 AS setup
COPY ./content /site/content
COPY ./archetypes /site/archetypes
COPY ./assets /site/assets
COPY ./hugo.yaml /site/hugo.yaml
COPY ./layouts /site/layouts
COPY ./static /site/static

FROM hugomods/hugo:dart-sass-0.165.0 AS build
COPY --from=setup /site /site
WORKDIR /site
RUN hugo build --minify

FROM scratch AS deploy
COPY --from=build /site/public /public

FROM hugomods/hugo:dart-sass-0.165.0 AS serve
COPY --from=setup /site /site
WORKDIR /site
EXPOSE 1313
ENTRYPOINT ["hugo", "serve", "--disableFastRender", "--bind=0.0.0.0", "-D"]

