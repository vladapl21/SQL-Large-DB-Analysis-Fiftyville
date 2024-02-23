-- Keep a log of any SQL queries you execute as you solve the mystery.

--  July 28, 2023 and that it took place on Humphrey Street

SELECT description FROM crime_scene_reports
WHERE month = 7 AND day = 28; -- time = 10.15 @ the bakery

SELECT hour, minute, activity, people.name, bakery_security_logs.license_plate FROM bakery_security_logs
JOIN people ON bakery_security_logs.license_plate = people.license_plate
WHERE year = 2023 AND month = 7 AND day = 28 AND (hour = 10 OR hour = 9); -- could be 5P2BI95, Vanessa

SELECT name, transcript FROM interviews
WHERE year = 2023 AND month = 7 AND day = 28; -- atm on leggett street thief withdrawing money earlier morning, accomplice on phonecall after robbery booking ticket (earliest flight next day)

SELECT people.name, amount FROM atm_transactions
JOIN bank_accounts ON bank_accounts.account_number = atm_transactions.account_number
JOIN people ON bank_accounts.person_id = people.id
WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location = "Leggett Street"; -- Iman, Luca, Diana, or Bruce

SELECT people.name, caller, receiver, duration FROM phone_calls
JOIN people ON phone_calls.caller = people.phone_number
WHERE year = 2023 AND month = 7 AND day = 28 AND duration < 60; -- Bruce or Diana

SELECT * FROM flights
WHERE year = 2023 AND month = 7 AND day = 29
ORDER BY hour; -- flight id = 36, destination id = 4

SELECT full_name, city FROM airports
WHERE id = 4; -- LaGuardia Airport = id:4, thief escaped to New York City

SELECT seat, people.name, flight_id FROM passengers
JOIN people ON passengers.passport_number = people.passport_number
WHERE flight_id = 36 AND (people.name = "Bruce" OR people.name = "Diana"); -- Bruce is thief

SELECT people.name, caller, receiver, duration FROM phone_calls
JOIN people ON phone_calls.receiver = people.phone_number
WHERE year = 2023 AND month = 7 AND day = 28 AND duration < 60 AND caller = "(367) 555-5533"; -- Robin is accomplice
