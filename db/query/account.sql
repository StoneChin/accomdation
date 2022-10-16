-- name: CreateAccount :execresult
INSERT INTO accounts (
  account_id,
  password,
  salt,
  role
) VALUES (
  $1, $2, $3, $4
);

-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1, $2;