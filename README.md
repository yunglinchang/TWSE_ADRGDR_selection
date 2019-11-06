# Stock Selection Modeling with TWSE ADR/GDR
An arbitrage strategy of the Taiwan Stock Exchange (TWSE) ADRs and GDRs using the concepts of drawdown, win rate, payoff ratio, and profit factor in R. (code automated)

The contributing model consists of the following process:
 - data preprocessing (raw ADR/GDR data from TWSE)
 - correlation plot
 - stock selection (Taiwan Top50 Tracker Fund)
 - measure setting (win rate, payoff ratio, and profit factor)
 - profit evaluation (including short sale situation and fee calculation)
 - hedging in options
 
## Build status
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger) [![codecov.io](https://img.shields.io/codecov/c/github/yunglinchang/TWSE_ADRGDR_arbitragestrategy?token=a4fbf1cd-47a6-4d2f-a192-efa16f002993)](https://img.shields.io/codecov/c/github/yunglinchang/TWSE_ADRGDR_arbitragestrategy?token=a4fbf1cd-47a6-4d2f-a192-efa16f002993)
## Code style
[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)

## R Packages Used
 - ggplot2
 - gcookbook
 - corrplot
 - RColorBrewer
 - openxlsx
 - data.table
 - imager

## Credits
This is the final project of Financial Computer Programming class in 2019 Spring semester.

## License
MIT © [Yung-Lin Chang]()