#' Get CWL version
#'
#' @param x CWL object
#'
#' @return CWL version number
#'
#' @export get_cwl_version
#'
#' @examples
#' system.file("cwl/sbg/workflow/gatk4-wgs.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   get_cwl_version()
#'
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   get_cwl_version()
get_cwl_version <- function(x) x$cwlVersion

# The CWL spec says that inputs/outputs/steps
# can be represented by a dictionary (can use the names directly)
# or by a list (need to parse the `id`s and everything inside it)

#' Get ID for inputs
#'
#' @param inputs Parsed inputs
#'
#' @return Vector of input IDs
#'
#' @export get_inputs_id
#'
#' @examples
#' # inputs represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_inputs() %>%
#'   get_inputs_id()
#'
#' # inputs represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_inputs() %>%
#'   get_inputs_id()
get_inputs_id <- function(inputs) {
  if (is_cwl_dict(inputs)) {
    id <- inputs$id
  } else if (is_cwl_list(inputs)) {
    id <- get_el_from_list(inputs, "id")
  } else {
    stop("`inputs` is not a proper dict or list")
  }

  id
}

#' Get label for inputs
#'
#' @param inputs Parsed inputs
#'
#' @return Vector of input labels
#'
#' @export get_inputs_label
#'
#' @examples
#' # inputs represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_inputs() %>%
#'   get_inputs_label()
#'
#' # inputs represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_inputs() %>%
#'   get_inputs_label()
get_inputs_label <- function(inputs) {
  if (is_cwl_dict(inputs)) {
    label <- inputs$label
  } else if (is_cwl_list(inputs)) {
    label <- get_el_from_list(inputs, "label")
  } else {
    stop("`inputs` is not a proper dict or list")
  }

  label
}

#' Get ID for outputs
#'
#' @param outputs Parsed outputs
#'
#' @return Vector of output IDs
#'
#' @export get_outputs_id
#'
#' @examples
#' # inputs represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_outputs() %>%
#'   get_outputs_id()
#'
#' # inputs represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_outputs() %>%
#'   get_outputs_id()
get_outputs_id <- function(outputs) {
  if (is_cwl_dict(outputs)) {
    id <- outputs$id
  } else if (is_cwl_list(outputs)) {
    id <- get_el_from_list(outputs, "id")
  } else {
    stop("`outputs` is not a proper dict or list")
  }

  id
}

#' Get label for outputs
#'
#' @param outputs Parsed outputs
#'
#' @return Vector of output labels
#'
#' @export get_outputs_label
#'
#' @examples
#' # inputs represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_outputs() %>%
#'   get_outputs_label()
#'
#' # inputs represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_outputs() %>%
#'   get_outputs_label()
get_outputs_label <- function(outputs) {
  if (is_cwl_dict(outputs)) {
    label <- outputs$label
  } else if (is_cwl_list(outputs)) {
    label <- get_el_from_list(outputs, "label")
  } else {
    stop("`outputs` is not a proper dict or list")
  }

  label
}

#' Get ID for steps
#'
#' @param steps Steps object parsed by \code{\link{parse_steps}}
#'
#' @return Vector of step IDs
#'
#' @export get_steps_id
#'
#' @examples
#' # steps represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_steps() %>%
#'   get_steps_id()
#'
#' # steps represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_steps() %>%
#'   get_steps_id()
get_steps_id <- function(steps) {
  if (is_cwl_dict(steps)) {
    id <- steps$id
  } else if (is_cwl_list(steps)) {
    id <- get_el_from_list(steps, "id")
  } else {
    stop("`steps` is not a proper dict or list")
  }

  id
}

#' Get label for steps
#'
#' @param steps Steps object parsed by \code{\link{parse_steps}}
#'
#' @return Vector of step labels
#'
#' @export get_steps_label
#'
#' @examples
#' # steps represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_steps() %>%
#'   get_steps_label()
#'
#' # steps represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_steps() %>%
#'   get_steps_label()
get_steps_label <- function(steps) {
  if (!is.null(steps$run)) {
    run <- steps$run
    if (is_cwl_dict(run)) {
      label <- run$label
    } else if (is_cwl_list(run)) {
      label <- get_el_from_list(run, "label")
    } else {
      stop("`steps$run` is not a proper dict or list")
    }
  } else {
    if (is_cwl_dict(steps)) {
      label <- steps$label
    } else if (is_cwl_list(steps)) {
      label <- get_el_from_list(steps, "label")
    } else {
      stop("`steps` is not a proper dict or list")
    }
  }

  label
}

#' Get documentation/description for steps
#'
#' @param steps Steps object parsed by \code{\link{parse_steps}}
#'
#' @return Vector of step documentation/descriptions
#'
#' @export get_steps_doc
#'
#' @examples
#' # steps represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_steps() %>%
#'   get_steps_doc()
#'
#' # steps represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_steps() %>%
#'   get_steps_doc()
get_steps_doc <- function(steps) {

  # get cwl version the hard way
  param <- NULL
  if ("v1.0" %in% c(steps$run$cwlVersion, steps$cwlVersion)) param <- "doc"
  if ("sbg:draft-2" %in% c(steps$run$cwlVersion, steps$cwlVersion)) param <- "description"
  if (is.null(param)) {
    if ("v1.0" %in% get_el_from_list(get_el_from_list(steps, "run"), "cwlVersion")) param <- "doc"
    if ("sbg:draft-2" %in% get_el_from_list(get_el_from_list(steps, "run"), "cwlVersion")) param <- "description"
  }

  if (!is.null(steps$run)) {
    run <- steps$run
    if (is_cwl_dict(run)) {
      desc <- run[[param]]
    } else if (is_cwl_list(run)) {
      desc <- get_el_from_list(run, param)
    } else {
      stop("`steps$run` is not a proper dict or list")
    }
  } else {
    if (is_cwl_dict(steps)) {
      desc <- steps[["run"]][[param]]
    } else if (is_cwl_list(steps)) {
      desc <- get_el_from_list(get_el_from_list(steps, "run"), param)
    } else {
      stop("`steps` is not a proper dict or list")
    }
  }

  desc
}

#' Get toolkit version for steps
#'
#' @param steps Steps object parsed by \code{\link{parse_steps}}
#'
#' @return Vector of step toolkit versions
#'
#' @export get_steps_version
#'
#' @examples
#' # steps represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_steps() %>%
#'   get_steps_version()
#'
#' # steps represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_steps() %>%
#'   get_steps_version()
get_steps_version <- function(steps) {
  if (!is.null(steps$run)) {
    run <- steps$run
    if (is_cwl_dict(run)) {
      version <- run$"sbg:toolkitVersion"
    } else if (is_cwl_list(run)) {
      version <- get_el_from_list(run, "sbg:toolkitVersion")
    } else {
      stop("`steps$run` is not a proper dict or list")
    }
  } else {
    if (is_cwl_dict(steps)) {
      version <- steps[["run"]][["sbg:toolkitVersion"]]
    } else if (is_cwl_list(steps)) {
      version <- unlist(get_el_from_list(get_el_from_list(steps, "run"), "sbg:toolkitVersion"))
    } else {
      stop("`steps` is not a proper dict or list")
    }
  }

  version
}

#' Get revision number for steps
#'
#' @param steps Steps object parsed by \code{\link{parse_steps}}
#'
#' @return Vector of step revision numbers
#'
#' @export get_steps_revision
#'
#' @examples
#' # steps represented by a dictionary
#' system.file("cwl/sbg/workflow/rnaseq-salmon.json", package = "tidycwl") %>%
#'   read_cwl_json() %>%
#'   parse_steps() %>%
#'   get_steps_revision()
#'
#' # steps represented by a list
#' system.file("cwl/sbg/workflow/rnaseq-salmon.cwl", package = "tidycwl") %>%
#'   read_cwl_yaml() %>%
#'   parse_steps() %>%
#'   get_steps_revision()
get_steps_revision <- function(steps) {

  # get cwl version the hard way
  param <- NULL
  if ("v1.0" %in% c(steps$run$cwlVersion, steps$cwlVersion)) param <- "sbg:latestRevision"
  if ("sbg:draft-2" %in% c(steps$run$cwlVersion, steps$cwlVersion)) param <- "sbg:revision"
  if (is.null(param)) {
    if ("v1.0" %in% get_el_from_list(get_el_from_list(steps, "run"), "cwlVersion")) param <- "sbg:latestRevision"
    if ("sbg:draft-2" %in% get_el_from_list(get_el_from_list(steps, "run"), "cwlVersion")) param <- "sbg:revision"
  }

  if (!is.null(steps$run)) {
    run <- steps$run
    if (is_cwl_dict(run)) {
      revision <- run[[param]]
    } else if (is_cwl_list(run)) {
      revision <- get_el_from_list(run, param)
    } else {
      stop("`steps$run` is not a proper dict or list")
    }
  } else {
    if (is_cwl_dict(steps)) {
      revision <- steps[["run"]][[param]]
    } else if (is_cwl_list(steps)) {
      revision <- unlist(get_el_from_list(get_el_from_list(steps, "run"), param))
    } else {
      stop("`steps` is not a proper dict or list")
    }
  }

  revision
}
