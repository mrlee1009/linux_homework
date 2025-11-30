#!/bin/bash

# =====================
# 1) CPU TOP5 기능
# =====================
cpu_top5() {
    echo
    echo "===== CPU TOP 5 Processes ====="
    echo

    ps -eo pid,comm,%cpu --sort=-%cpu 2>/dev/null |
    head -n 6 |
    awk '
        NR==1 { printf "%-10s %-25s %-10s\n", "PID", "PROCESS", "CPU%" }
        NR>1  { printf "%-10s %-25s %-10s\n", $1, $2, $3 }
    '

    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        echo "오류: 프로세스 정보를 가져올 수 없습니다."
    fi

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
    echo
    echo "=== 현재 LISTEN 중인 TCP 포트 및 PID ==="
    echo "프로토콜   로컬주소:포트        PID"
    echo "----------------------------------------"

    netstat -ano | grep 'LISTEN' | while read LINE; do
        PROTO=$(echo "$LINE" | awk '{print $1}')
        LOCAL=$(echo "$LINE" | awk '{print $2}')
        PID=$(echo "$LINE" | awk '{print $5}')
        printf "%-7s %-20s %s\n" "$PROTO" "$LOCAL" "$PID"
    done

    echo "----------------------------------------"
    echo
}

# =====================
# 4) Git log 분석 기능
# =====================
gitlog_ranking() {
    echo
    echo "========================================"
    echo "     프로젝트 커밋 기여자 순위 분석 "
    echo "========================================"

    git log --pretty=format:"%an" | sort | uniq -c | sort -nr | while read count name
    do
        printf " %s 커밋: %s\n" "$count" "$name"
    done
    
    echo "----------------------------------------"
    echo "분석 완료: 커밋 수가 많은 순서대로 정렬되었습니다."
    echo
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