db:
  image: mdillon/postgis
  ports:
    - "5432"
web:
  build: .
  command: rails s -p 80
  # environment:
  #   RACK_ENV: development
  #   DATABASE_URL: postgres://postgres@db:5432/citygram_development
  volumes:
    - .:/myapp
  ports:
    - "80:80"
  links:
    - db
# test:
#   build: .
#   command: rake
#   volumes:
#     - .:/myapp
#   environment:
#     RACK_ENV: test
#     DATABASE_URL: postgres://postgres@db:5432/citygram_test
#   links:
#     - db
