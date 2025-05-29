package logger

import (
    "go.uber.org/zap"
)

func NewLogger() (*zap.Logger, error) {
    cfg := zap.NewProductionConfig()
    cfg.OutputPaths = []string{"stdout"}
    cfg.Encoding = "json"
    return cfg.Build()
}
