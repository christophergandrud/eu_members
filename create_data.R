# ---------------------------------------------------------------------------- #
# Create a data frame and save as CSV a list of EU members and their membership
# years.
# Christopher Gandrud
# ---------------------------------------------------------------------------- #

# Set working directory. Save as needed.
setwd('/git_repositories/eu_members/')

# Load required packages
library(countrycode)
library(DataCombine)
library(rio)

# Specify current year. Update as need be
current <- 2015

# Create EU members data frame

country <- c(rep('Austria', length(1995:current)), 
      rep('Belgium', length(1958:current)),
      rep('Bulgaria', length(2007:current)),
      rep('Cyprus', length(2004:current)),
      rep('Croatia', length(2013:current)),
      rep('Czech Republic', length(2004:current)),
      rep('Denmark', length(1973:current)),
      rep('Estonia', length(2004:current)),
      rep('Finland', length(1995:current)),
      rep('France', length(1958:current)),
      rep('Germany', length(1958:current)),
      rep('Greece', length(1981:current)),
      rep('Hungary', length(2004:current)),
      rep('Ireland', length(1973:current)),
      rep('Italy', length(1958:current)),
      rep('Latvia', length(2004:current)),
      rep('Lithuania', length(2004:current)),
      rep('Luxembourg', length(1958:current)),
      rep('Malta', length(2004:current)),
      rep('Netherlands', length(1958:current)),
      rep('Poland', length(2004:current)),
      rep('Portugal', length(1986:current)),
      rep('Romania', length(2007:current)),
      rep('Slovakia', length(2004:current)),
      rep('Slovenia', length(2004:current)),
      rep('Spain', length(1986:current)),
      rep('Sweden', length(1995:current)),
      rep('United Kingdom', length(1973:current))
      )

year <- c(1995:current, 
             1958:current,
             2007:current,
             2004:current,
             2013:current,
             2004:current,
             1973:current,
             2004:current,
             1995:current,
             1958:current,
             1958:current,
             1981:current,
             2004:current,
             1973:current,
             1958:current,
             2004:current,
             2004:current,
             1958:current,
             2004:current,
             1958:current,
             2004:current,
             1986:current,
             2007:current,
             2004:current,
             2004:current,
             1986:current,
             1995:current,
             1973:current
)

eu_members <- data.frame(country, year)

# Add iso2c code
eu_members$iso2c <- countrycode(eu_members$country, origin = 'country.name',
                                destination = 'iso2c')
eu_members <- MoveFront(eu_members, 'iso2c')

# Save
export(eu_members, file = 'eu_membership.csv')
