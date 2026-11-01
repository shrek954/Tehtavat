#!/bin/bash

REPORT="analysis_report.txt"

echo "Repository Analysis Report" > $REPORT
echo "=========================" >> $REPORT
echo "" >> $REPORT

echo "Detected languages:" >> $REPORT

find . -type f -name "*.py" | grep -q . && echo "- Python" >> $REPORT
find . -type f -name "*.js" | grep -q . && echo "- JavaScript" >> $REPORT
find . -type f -name "*.ts" | grep -q . && echo "- TypeScript" >> $REPORT
find . -type f -name "*.java" | grep -q . && echo "- Java" >> $REPORT
find . -type f -name "*.html" | grep -q . && echo "- HTML" >> $REPORT
find . -type f -name "*.css" | grep -q . && echo "- CSS" >> $REPORT

echo "" >> $REPORT
echo "Design patterns detected:" >> $REPORT

grep -R "getInstance" . >/dev/null 2>&1 && echo "- Singleton" >> $REPORT

grep -RE "create[A-Z]|factory" . >/dev/null 2>&1 && echo "- Factory Method" >> $REPORT

grep -RE "notify|subscribe|observer" . >/dev/null 2>&1 && echo "- Observer" >> $REPORT

grep -R "Strategy" . >/dev/null 2>&1 && echo "- Strategy" >> $REPORT

grep -RE "Decorator|wrap" . >/dev/null 2>&1 && echo "- Decorator" >> $REPORT

echo ""
cat $REPORT
