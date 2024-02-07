#!/bin/sh

TARGET=list.tex
#SRC=`find . -name '*.tex' | sort`
#SRC=`find . -name "../*/ITCannual-list-*.tex" | sort`
SRC=`ls ../*/ITCannual-list-*.tex | sort`

find . -name '*.tex' | xargs nkf --overwrite -w -Lu

cat ITCannual-list-template.tex > ${TARGET}

i=0
for args in ${SRC}
do 
    file=${args%.tex}
    file=${file#./}

    if [ ${file} != "list" -a ${file} != "ITCannual-list-template" ]; then
       echo ${file}
       sed -n '/begin{受賞}/,/end{受賞}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_award.tex
       sed -n '/begin{招待講演}/,/end{招待講演}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_invit1.tex
       sed -n '/begin{招待論文}/,/end{招待論文}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_invit2.tex
       sed -n '/begin{著書}/,/end{著書}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_book.tex
       sed -n '/begin{雑誌論文}/,/end{雑誌論文}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_journal.tex
       sed -n '/begin{査読付}/,/end{査読付}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_review.tex
       sed -n '/begin{特許}/,/end{特許}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_patent.tex
       sed -n '/begin{発表}/,/end{発表}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_present.tex
       sed -n '/begin{公開}/,/end{公開}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_publish.tex
       sed -n '/begin{特記}/,/end{特記}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_note.tex
       sed -n '/begin{報道}/,/end{報道}/p' ${file}.tex | sed -e '$d' -e '1d' > ${file}_news.tex
       
       sed -n '1,/end{受賞}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_award.tex >> tmp
       sed -n '/end{受賞}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
       
       sed -n '1,/end{招待講演}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_invit1.tex >> tmp
       sed -n '/end{招待講演}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}

       sed -n '1,/end{招待論文}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_invit2.tex >> tmp
       sed -n '/end{招待論文}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}

       sed -n '1,/end{著書}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_book.tex >> tmp
       sed -n '/end{著書}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
       
       sed -n '1,/end{雑誌論文}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_journal.tex >> tmp
       sed -n '/end{雑誌論文}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}

       sed -n '1,/end{査読付}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_review.tex >> tmp
       sed -n '/end{査読付}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
       
       sed -n '1,/end{発表}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_present.tex >> tmp
       sed -n '/end{発表}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
       
       sed -n '1,/end{特許}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_patent.tex >> tmp
       sed -n '/end{特許}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
       
       sed -n '1,/end{公開}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_publish.tex >> tmp
       sed -n '/end{公開}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
       
       sed -n '1,/end{特記}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_note.tex >> tmp
       sed -n '/end{特記}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}

       sed -n '1,/end{報道}/p' ${TARGET} | sed -e '$d' > tmp
       cat ${file}_news.tex >> tmp
       sed -n '/end{報道}/,$p' ${TARGET} >> tmp
       cat tmp > ${TARGET}
    fi

done

rm tmp ../*/*_award.tex ../*/*_invit1.tex ../*/*_invit2.tex ../*/*_book.tex ../*/*_journal.tex ../*/*_review.tex ../*/*_patent.tex ../*/*_present.tex ../*/*_publish.tex ../*/*_note.tex ../*/*_news.tex
