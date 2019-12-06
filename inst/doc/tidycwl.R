## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(comment = "")

## -----------------------------------------------------------------------------
library("tidycwl")

## -----------------------------------------------------------------------------
flow <- system.file("cwl/sbg/workflow/gatk4-wgs.json", package = "tidycwl") %>%
  read_cwl_json()
flow

## -----------------------------------------------------------------------------
flow %>%
  parse_inputs() %>%
  names()

flow %>%
  parse_outputs() %>%
  names()

flow %>%
  parse_steps() %>%
  names()

## -----------------------------------------------------------------------------
flow %>%
  parse_steps() %>%
  get_steps_label()

## -----------------------------------------------------------------------------
get_graph(
  flow %>% parse_inputs(),
  flow %>% parse_outputs(),
  flow %>% parse_steps()
) %>% str()

## ---- screenshot.force=FALSE--------------------------------------------------
if (rmarkdown::pandoc_available("1.12.3")) {
  get_graph(
    flow %>% parse_inputs(),
    flow %>% parse_outputs(),
    flow %>% parse_steps()
  ) %>% visualize_graph()
}

