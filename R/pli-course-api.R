#' Course gradebook
#'
#' Obtains the course gradebook
#'
#' @param course_instance_id Integer value associated with the course.
#'
#' @return
#' A `data.frame`
#'
#' @rdname gradebook
#' @export
pl_course_gradebook = function(course_instance_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "gradebook",
              sep = "/")

  # jsonlite can't unnest assessment!
  tidyr::unnest(pl_get_df(url), cols = c("assessments"))
}


#' View Assessment Overviews
#'
#' See a list of all assessments or view data for a single assessment.
#'
#' @inheritParams pl_course_gradebook
#' @param assessment_id Integer of a specific assessment to view.
#'
#' @return
#' A `data.frame`
#' @rdname assessments
#' @export
pl_assessment_list = function(course_instance_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "assessments",
              sep = "/")

  pl_get_df(url)
}

#' @rdname assessments
#' @export
pl_assessment_view = function(course_instance_id, assessment_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "assessments", assessment_id,
              sep = "/")

  pl_get_df(url)
}

#' View Assessment Instances
#'
#' See a list of all assessment instances for a given assessment or view
#' results from a single assessment instance.
#'
#' @inheritParams pl_course_gradebook
#' @inheritParams pl_assessment_list
#' @param assessment_instance_id Integer of student assessment.
#'
#' @rdname assessment-instance
#' @export
pl_assessment_instance_list = function(course_instance_id, assessment_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "assessments",  assessment_id, "assessment_instances",
              sep = "/")

  pl_get_df(url)
}

#' @rdname assessment-instance
#' @export
pl_assessment_instance_view = function(course_instance_id, assessment_instance_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "assessment_instances", assessment_instance_id,
              sep = "/")

  pl_get_df(url)
}

#' View Submissions on Assessment Instances
#'
#' Obtain a list of all submissions within a given assessment instances or view
#' results from a single submission inside the course.
#'
#' @inheritParams pl_course_gradebook
#' @inheritParams pl_assessment_instance_view
#' @param submission_id Integer of student submission attempt.
#'
#' @rdname assessment-submission
#' @export
pl_assessment_submission_list = function(course_instance_id, assessment_instance_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "assessment_instances", assessment_instance_id, "submissions",
              sep = "/")

  pl_get_df(url)
}

#' @rdname assessment-submission
#' @export
pl_assessment_submission_view = function(course_instance_id, submission_id) {

  url = paste(pl_api_url(),
              "course_instances", course_instance_id, "submissions", submission_id,
              sep = "/")

  pl_get_df(url)
}

