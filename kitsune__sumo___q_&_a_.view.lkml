view: kitsune__sumo___q_&_a_ {
    
    
    derived_table: {
        sql: SELECT `kitsune_questions`.`question_id` AS `question_id`,
  
  `kitsune_questions`.`created_date` AS `created_date`,
  `kitsune_questions`.`creator_username` AS `creator_username`,
  `kitsune_questions`.`updated` AS `updated`,
  `kitsune_questions`.`updated_by` AS `updated_by`,
  `kitsune_questions`.`is_solved` AS `is_solved`,
  `kitsune_questions`.`locale` AS `locale`,
  `kitsune_questions`.`product` AS `product`,
  `kitsune_questions`.`title` AS `title`,
  `kitsune_questions`.`topic` AS `topic`,
   `kitsune_questions`.`question_content` AS `question_content`,
  `kitsune_questions`.`solved_by` AS `solved_by`,
  `kitsune_questions`.`num_votes` AS `num_votes`,
  `kitsune_questions`.`num_votes_past_week` AS `num_votes_past_week`,
  `kitsune_questions`.`last_answer` AS `last_answer`,
  `kitsune_questions`.`metadata_array` AS `metadata_array`,
  `kitsune_questions`.`tags_array` AS `tags_array`,
  `kitsune_questions`.`solution` AS `solution`,  


  `kitsune_answers`.`answer_id` AS `answer_id`,
  `kitsune_answers`.`question_id` AS `question_id__kitsune_answers_`,
  `kitsune_answers`.`answer_content` AS `answer_content`,
  `kitsune_answers`.`created_date` AS `created_date__kitsune_answers`,
  `kitsune_answers`.`creator_username` AS `creator_username__kitsune_answers_`,
  `kitsune_answers`.`updated` AS `updated__kitsune_answers_`,
  `kitsune_answers`.`updated_by` AS `updated_by__kitsune_answers_`,
  `kitsune_answers`.`is_spam` AS `is_spam`,
  `kitsune_answers`.`num_helpful_votes` AS `num_helpful_votes`,
  `kitsune_answers`.`num_unhelpful_votes` AS `num_unhelpful_votes`
FROM `dp2-prod.sumo`.`kitsune_questions` `kitsune_questions`
  LEFT JOIN `dp2-prod.sumo`.`kitsune_answers` `kitsune_answers` ON (`kitsune_questions`.`question_id` = `kitsune_answers`.`question_id`) 
            ;;
    }
    
    
    
    
}