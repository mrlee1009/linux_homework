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
    echo "[확장자별 파일 개수 분석 기능 실행]"

    read -p "분석할 디렉토리 경로를 입력하세요: " target_dir

    if [ ! -d "$target_dir" ]; then
        echo "오류: 유효한 디렉토리가 아닙니다."
        return
    fi

    find "$target_dir" -type f | awk -F. '{print $NF}' | sort | uniq -c
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