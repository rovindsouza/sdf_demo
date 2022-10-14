view: custom_sql_query_id_1 {
    
    
    derived_table: {
        sql: SELECT `kitsune_sentiment`.`discrete_sentiment` AS `discrete_sentiment`,
   `kitsune_sentiment`.`question_id` AS `question_id`,


  `kitsune_sentiment`.`num_votes` AS `num_votes`,
  `kitsune_sentiment`.`question_content` AS `question_content`,
  `kitsune_sentiment`.`created_date` AS `created_date`,

  `kitsune_sentiment`.`locale` AS `locale`,
  `kitsune_sentiment`.`product` AS `product`,

  `kitsune_sentiment`.`is_solved` AS `is_solved`,

  `kitsune_sentiment`.`title` AS `title`,

  `kitsune_sentiment`.`topic` AS `topic`,

FROM `dp2-prod`.`sumo`.`kitsune_sentiment` `kitsune_sentiment` 
            ;;
    }
    
    
    
    
    dimension: _measure_names {
        type: string
        
        label: ":Measure Names"
        
        sql: ${TABLE}._measure_names;;
        
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
    
    
    dimension: discrete_sentiment {
        type: string
        
        label: "Sentiment"
        
        sql: ${TABLE}.discrete_sentiment;;
        
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
    
    
    dimension: locale {
        type: string
        
        label: "Locale"
        
        sql: ${TABLE}.locale;;
        
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
    
    
    measure: at_least_10_count {
        label: "At least 10 count"
        type: number
        sql: IF SUM(${number_of_records})<10 THEN "exclude" else "include" END ;;
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