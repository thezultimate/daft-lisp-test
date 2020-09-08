FROM fukamachi/sbcl:latest-alpine as build

RUN mkdir /app

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
         --load "daft-lisp-test.asd" \
         --eval '(ql:quickload :daft-lisp-test)' \
         --eval '(daft-lisp-test:create-executable)'

ENTRYPOINT ["/app/daft-lisp-test"]

EXPOSE 4242