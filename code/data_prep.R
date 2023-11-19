Jalshtr <- fmxdat::Jalshtr %>%
    mutate(YM = format(date, "%Y%B")) %>% group_by(YM) %>%
    filter(date == last(date)) %>% arrange(date) %>%
    ungroup() %>%
    mutate(Returns = TRI / lag(TRI) - 1) %>% filter(date > first(date)) %>% select(-TRI, -YM)