package warehouse

import (
    "context"
    "github.com/jackc/pgx/v5"
)

type Repository struct {
    conn *pgx.Conn
}

func NewRepository(conn *pgx.Conn) *Repository {
    return &Repository{conn: conn}
}
