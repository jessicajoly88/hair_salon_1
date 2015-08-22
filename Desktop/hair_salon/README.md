This is my third code review. Hair Salon is a website that holds information for clients and stylists. On the back end side of things, unit specs and Ruby code works for the one to many relationship works for the stylist and the client class. The integration specs are incomplete. On the front end of things with Sinatra, the user is able to: view a list of stylists, add new stylists, update and delete the stylists.

The PSQL database details for this application are as follows:

CREATE DATABASE hair_salon;

CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id, phone_number varchar);

CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

