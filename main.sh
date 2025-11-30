#!/bin/bash

# =====================
# 1) CPU TOP5 기능
# =====================
cpu_top5() {
    echo
    echo "===== CPU TOP 5 Processes ====="
    echo

    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk '
        NR==1 { printf "%-10s %-25s %-10s\n", "PID", "PROCESS", "CPU%" }
        NR>1 { printf "%-10s %-25s %-10s\n", $1, $2, $3 }
    '

    echo
}

# =====================
# 2) 확장자별 개수 기능
# =====================
ext_counter() {
    :
}

# =====================
# 3) 활성 포트 기능
# =====================
port_process() {
    :
}

# =====================
# 4) Git log 분석 기능
# =====================
gitlog_ranking() {
    :
}

# =====================
# 메뉴
# =====================
while true; do
    echo "1) CPU Top 5"
    echo "2) 확장자별 파일 개수"
    echo "3) 활성 포트 및 프로세스"
    echo "4) Git 커밋 순위"
    echo "5) 종료"
    read -p "선택: " choice

    case $choice in
        1) cpu_top5 ;;
        2) ext_counter ;;
        3) port_process ;;
        4) gitlog_ranking ;;
        5) exit 0 ;;
        *) echo "잘못된 선택" ;;
    esac
done