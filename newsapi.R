library(httr2)

req <- request("https:///newsapi.org/v2/everything") |>
  req_url_query(
    q = '`"data science"`',
    from = Sys.Date() - 1,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )

resp <- req_perform(req)
curr_date <- lubridate::date(Sys.Date())

write(jsonlite::toJSON(resp_body_json(resp)), file = paste0("data/", curr_date, ".json"))
