FROM fukamachi/sbcl:latest-alpine as build

COPY ./*.lisp /app/
COPY ./*.asd /app/

WORKDIR /app

RUN sbcl --non-interactive --eval '(ql:quickload (list :hunchentoot))'


FROM fukamachi/sbcl:latest-alpine as dist

COPY --from=build /app/*.lisp /app/
COPY --from=build /app/*.asd /app/
COPY --from=build /root /root

WORKDIR /app

RUN sbcl --non-interactive \
         --load "test.asd" \
         --eval '(ql:quickload :test)' \
         --eval '(test:create-executable)'

ENTRYPOINT ["/app/test"]

EXPOSE 4242