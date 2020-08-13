# Stock Selection Modeling with TWSE ADR/GDR
The project aims to develop a profitable arbitrage strategy that will score the highest on metrics (win rate, payoff ratio, and profit ratio) for the Taiwan Stock Exchange (TWSE) ADRs and GDRs.

The contributing model consists of the following process:
 - data preprocessing (raw ADR/GDR data from TWSE)
 - correlation plot
 - stock selection (Taiwan Top50 Tracker Fund)
 - measure setting (win rate, payoff ratio, and profit factor)
 - profit evaluation (including short sale situation and fee calculation)
 - hedging in options
 
## Build status
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger) [![codecov](https://codecov.io/gh/yunglinchang/TWSE_ADRGDR_selection/branch/master/graph/badge.svg)](https://codecov.io/gh/yunglinchang/TWSE_ADRGDR_selection)
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
