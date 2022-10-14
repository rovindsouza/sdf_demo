view: custom_sql_query {
    
    
    derived_table: {
        sql: SELECT 
COUNTIF(helpful.helpful IS TRUE) AS helpful,
COUNTIF(helpful.helpful IS NOT TRUE) AS not_helpful,
MIN(ga_pageviews) AS ga_pageviews,
lang,
ga_exitPagePath,
category, 
ga_exitRate,
ga_exits,
ga_date,

doc.title as doc_title, doc.slug, prod.title as product_title 
FROM `dp2-prod.sumo.kitsune_wiki_helpfulvote` helpful 
  LEFT JOIN `dp2-prod.sumo.kitsune_wiki_document` doc 
    ON (doc.current_revision_id=helpful.revision_id) 
  LEFT JOIN `dp2-prod.sumo.kitsune_wiki_document_products` doc_prod 
    ON (doc.id=document_id) 
  LEFT JOIN `dp2-prod.sumo.kitsune_products_product` prod 
    ON (doc_prod.product_id=prod.id) 
  LEFT JOIN `dp2-prod.sumo.ga_kb_exit_rate_by_product_with_lang` exitrate 
    ON (doc.slug=REGEXP_EXTRACT(ga_exitPagePath, "/([^/]+)$"))
WHERE doc.title IS NOT NULL 
  
  GROUP BY 4,5,6,7,8, 9, 10, 11, 12 ORDER BY 6 ,3 desc 
            ;;
    }
    
    
    
    
    dimension: _measure_names {
        type: string
        
        label: ":Measure Names"
        
        sql: ${TABLE}._measure_names;;
        
    }
    
    
    dimension: category {
        type: number
        
        label: "category"
        
        sql: ${TABLE}.category;;
        
    }
    
    
    dimension_group: created_date {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Created Date"
        
        sql: ${TABLE}.created_date;;
        
    }
    
    
    dimension_group: date {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Date"
        sql: DATE(${created_date_raw});;
        
    }
    
    
    dimension: date_parameter {
        type: yesno
        
        label: "Date Parameter"
        sql: ${Parameters}.${Parameter 1} = DATETRUNC('week', ${created_date_raw});;
        
    }
    
    
    dimension: date_parameter_filter_m_ {
        type: yesno
        
        label: "Date Parameter Filter(m)"
        sql: ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872} = DATETRUNC('month', ${ga_date_raw});;
        
    }
    
    
    dimension: date_parameter_filter_w_ {
        type: yesno
        
        label: "Date Parameter Filter(w)"
        sql: ${Parameters}.${Parameter 1} = DATETRUNC('week', ${ga_date_raw});;
        
    }
    
    
    dimension: discrete_sentiment {
        type: string
        
        label: "Sentiment"
        
        sql: ${TABLE}.discrete_sentiment;;
        
    }
    
    
    dimension: doc_title {
        type: string
        
        label: "Article Title"
        
        sql: ${TABLE}.doc_title;;
        
    }
    
    
    dimension_group: ga_date {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "ga_date"
        
        sql: ${TABLE}.ga_date;;
        
    }
    
    
    dimension: ga_exitpagepath {
        type: string
        
        label: "ga_exitPagePath"
        
        sql: ${TABLE}.ga_exitpagepath;;
        
    }
    
    
    dimension: ga_exitrate {
        type: number
        
        label: "ga_exitRate"
        
        sql: ${TABLE}.ga_exitrate;;
        
    }
    
    
    dimension: ga_exits {
        type: number
        
        label: "ga_exits"
        
        sql: ${TABLE}.ga_exits;;
        
    }
    
    
    dimension: ga_pageviews {
        type: number
        
        label: "Pageviews"
        
        sql: ${TABLE}.ga_pageviews;;
        
    }
    
    
    dimension: helpful {
        type: number
        
        label: "Helpful"
        
        sql: ${TABLE}.helpful;;
        
    }
    
    
    dimension: info {
        type: string
        
        label: "info"
        sql: " ";;
        
    }
    
    
    dimension: is_solved {
        type: yesno
        
        label: "Is Solved"
        
        sql: ${TABLE}.is_solved;;
        
    }
    
    
    dimension: kb_url_link {
        type: string
        
        label: "KB URL link"
        sql: "https://support.mozilla.org/" +STR(${ga_exitPagePath});;
        
    }
    
    
    dimension: lang {
        type: string
        
        label: "lang"
        
        sql: ${TABLE}.lang;;
        
    }
    
    
    dimension: locale {
        type: string
        
        label: "Locale"
        
        sql: ${TABLE}.locale;;
        
    }
    
    
    dimension: not_helpful {
        type: number
        
        label: "Not helpful"
        
        sql: ${TABLE}.not_helpful;;
        
    }
    
    
    dimension: num_votes {
        type: number
        
        label: "Num Votes"
        
        sql: ${TABLE}.num_votes;;
        
    }
    
    
    dimension: product {
        type: string
        
        label: "Product"
        
        sql: ${TABLE}.product;;
        
    }
    
    
    dimension: product_title {
        type: string
        
        label: "product_title"
        
        sql: ${TABLE}.product_title;;
        
    }
    
    
    dimension: question_content {
        type: string
        
        label: "Question Content"
        
        sql: ${TABLE}.question_content;;
        
    }
    
    
    dimension: question_content__ {
        type: string
        
        label: "Question Content  "
        sql: REGEXP_REPLACE(${question_content}, '<.*?>',"");;
        
    }
    
    
    dimension: question_content_edited {
        type: string
        
        label: "Question Content Edited"
        sql: REGEXP_REPLACE(${question_content__}, '\\n'," ");;
        
    }
    
    
    dimension: question_id {
        type: number
        
        label: "question_id"
        
        sql: ${TABLE}.question_id;;
        
    }
    
    
    dimension: question_link {
        type: string
        
        label: "Question link"
        sql: "https://support.mozilla.org/questions/" + STR(${question_id});;
        
    }
    
    
    dimension: slug {
        type: string
        
        label: "slug"
        
        sql: ${TABLE}.slug;;
        
    }
    
    
    dimension: title {
        type: string
        
        label: "Title"
        
        sql: ${TABLE}.title;;
        
    }
    
    
    dimension: topic {
        type: string
        
        label: "Topic"
        
        sql: ${TABLE}.topic;;
        
    }
    
    
    dimension: wow_change__change_color__exit_rate_ {
        type: string
        
        label: "WoW Change  change color (Exit Rate)"
        sql: If ${Change % (Pageviews) (copy)_5628092193232367617} > 0 THEN 'green' else ' red' end;;
        
    }
    
    
    dimension: wow_change__change_color__exit_rate___m__ {
        type: string
        
        label: "WoW Change  change color (Exit Rate) (m) "
        sql: If  ${Change % (Exit Rate) (w) (copy)_2478739066049126424}> 0 THEN 'green' else ' red' end;;
        
    }
    
    
    dimension: wow_change__change_color__pageviews__m_ {
        type: string
        
        label: "WoW Change  change color (Pageviews)(m)"
        sql: If ${Change % (Pageviews)(w) (copy)_2478739066036568079} > 0 THEN 'green' else ' red' end;;
        
    }
    
    
    dimension: wow_change__change_color__pageviews__w_ {
        type: string
        
        label: "WoW Change  change color (Pageviews)(w)"
        sql: If ${change_%__pageviews__w_} > 0 THEN 'green' else ' red' end;;
        
    }
    
    
    measure: 0 {
        label: "0"
        type: number
        sql: 1 ;;
    }
    
    measure: 1 {
        label: "1"
        type: number
        sql: 1 ;;
    }
    
    measure: 2 {
        label: "2"
        type: number
        sql: 1 ;;
    }
    
    measure: at_least_10_count {
        label: "At least 10 count"
        type: number
        sql: IF SUM(${number_of_records})<10 THEN "exclude" else "include" END ;;
    }
    
    measure: change_%_(exit_rate)_(m) {
        label: "Change % (Exit Rate) (m)"
        type: number
        sql: ({ FIXED ${doc_title} : AVG(

if DATEADD('month', 0, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${exit_rate} ) }  

end ) 
}


-


{ FIXED ${doc_title} : AVG(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${exit_rate} ) }  

end ) 
}) ;;
    }
    
    measure: change_%_(exit_rate)_(w) {
        label: "Change % (Exit Rate) (w)"
        type: number
        sql: ({ FIXED ${doc_title} : AVG(

if DATEADD('week', 0, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${exit_rate} ) }  

end ) 
}


-


{ FIXED ${doc_title} : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${exit_rate} ) }  

end ) 
}) ;;
    }
    
    measure: change_%_(pageviews)(m) {
        label: "Change % (Pageviews)(m)"
        type: number
        sql: ({ FIXED ${doc_title} : SUM(

if DATEADD('month', 0, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
}


-


{ FIXED ${doc_title} : SUM(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
})/ { FIXED ${doc_title} : SUM(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
} ;;
    }
    
    measure: change_%_(pageviews)(m)_(test) {
        label: "Change % (Pageviews)(m) (test)"
        type: number
        sql: ({ FIXED ${doc_title} : SUM(

if DATEADD('month', 0, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
}


-


{ FIXED ${doc_title} : SUM(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
}) ;;
    }
    
    measure: change_%_(pageviews)(w) {
        label: "Change % (Pageviews)(w)"
        type: number
        sql: ({ FIXED ${doc_title} : SUM(

if DATEADD('week', 0, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
}


-


{ FIXED ${doc_title} : SUM(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
})/ { FIXED ${doc_title} : SUM(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
} ;;
    }
    
    measure: exit_rate {
        label: "Exit Rate"
        type: number
        sql: ZN(${ga_exits}/${ga_pageviews}) ;;
    }
    
    measure: helpful__% {
        label: "Helpful  %"
        type: number
        sql: ${helpful}/(${helpful}+${not_helpful}) ;;
    }
    
    measure: negative {
        label: "Negative"
        type: number
        sql: -(IF ${discrete_sentiment}= 'negativ'  THEN ZN(${number_of_records}) END) ;;
    }
    
    measure: number_of_records {
        label: "Number of Records"
        type: number
        sql: 1 ;;
    }
    
    measure: previous_month_(exit_rate)(m) {
        label: "Previous Month (Exit Rate)(m)"
        type: number
        sql: { FIXED ${doc_title} : AVG(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${exit_rate} ) }  

end ) 
} ;;
    }
    
    measure: previous_month_(m) {
        label: "Previous Month (m)"
        type: number
        sql: { FIXED ${doc_title} : SUM(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('month', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
} ;;
    }
    
    measure: previous_week_(exit_rate) {
        label: "Previous Week (Exit Rate)"
        type: number
        sql: { FIXED ${doc_title} : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${exit_rate} ) }  

end ) 
} ;;
    }
    
    measure: previous_week_(w) {
        label: "Previous Week (w)"
        type: number
        sql: { FIXED ${doc_title} : SUM(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ga_date_raw})  THEN  

{ FIXED ${doc_title}, DATETRUNC('week', ${ga_date_raw}): AVG(${ga_pageviews} ) }  

end ) 
} ;;
    }
    
    measure: sumo_post {
        label: "SUMO post"
        type: number
        sql: IF ${discrete_sentiment} = "positive" OR ${discrete_sentiment} = "neutral" THEN ${number_of_records} ELSEIF  ${discrete_sentiment} ="negativ" THEN -${number_of_records} END ;;
    }
    
    measure: sumo_post_unique {
        label: "SUMO post unique"
        type: number
        sql: IF ATTR(${discrete_sentiment}) = "positive" OR ATTR(${discrete_sentiment}) = "neutral" THEN ${unique_records} ELSEIF  ATTR(${discrete_sentiment}) ="negativ" THEN -${unique_records} END ;;
    }
    
    measure: topic_count {
        label: "Topic count"
        type: number
        sql: {FIXED ${question_id}, ${topic}: COUNT(${number_of_records})} ;;
    }
    
    measure: unique_records {
        label: "Unique Records"
        type: number
        sql: ZN(COUNTD(${question_id})) ;;
    }
    
}