#!/bin/bash

# =====================
# 1) CPU TOP5 기능
# =====================
cpu_top5() {
    :
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
    echo "========================================"
    echo "    ✨ 프로젝트 커밋 기여자 순위 분석 ✨"
    echo "========================================"

    git log --pretty=format:"%an" | sort | uniq -c | sort -nr | while read count name
    do
        printf " %s 커밋: %s\n" "$count" "$name"
    done
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