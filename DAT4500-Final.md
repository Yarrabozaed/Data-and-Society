The Workforce in Crisis: Understanding the Link between State-Level
COVID-19 Responses and Low-Income Employment
================

## Report Info

This report was written by Yarra Abozaed, Janelle Acob, Zach Johansen,
and Tim Chen, for DAT 4500 (Data and Society), taught by Dr. Gill, due
on June 8th, 2023.

## Abstract

\[**TODO**\]

## Introduction

The COVID-19 pandemic has had a lasting impact on the global economy,
reshaping the way companies engage with customers and manage their
internal operations. Among the groups most heavily affected by the
pandemic are low-income job holders, who experienced unstable employment
conditions from 2020 to 2022. We define low-income jobs in this report
as those where workers earn less than $40,000 annually. While federal
actions were implemented in the United States, some states independently
adopted measures to mitigate the spread of COVID-19.

This paper aims to examine the correlation between the COVID-19 response
measures implemented by each state and their impact on the workforce,
particularly low-income employees. The primary focus is on variables
related to COVID-19 and the healthcare system within each state.
Additionally, we consider other factors such as the state’s political
lean and economic indicators like average salary.

Our objective is to assess the extent to which each discussed variable
contributed to the fluctuation in low-income job numbers during the
pandemic. To achieve this, we first outline the datasets used for our
research. Subsequently, we present our statistical methods and the
results obtained. Finally, we provide an analysis and interpretation of
the data, offering insights into how this prediction can assist states
in determining ideal response measures for their regions in future
health crises.

## Methods and Datasets

### [Rate of Vaccination](https://covid.cdc.gov/covid-data-tracker/#vaccinations_vacc-total-admin-count-total)

This data was collected by the CDC in which it highlights the covid-19
vaccinations distribution per state. It includes the number of people
receiving at least one dose, the number of people who are fully
vaccinated, and the number of people with an updated (bivalent) booster
dose based on information reported to CDC on dose number, dose
manufacturer, administration date, recipient ID, and date of submission.
This dataset was last updated on May 10th, 2023. CDC estimates are based
on data that include a dose number (first, second, or booster). To
protect the privacy of vaccine recipients, CDC receives data without any
personally identifiable information (deidentified data). Each
jurisdiction or provider uses a unique person identifier to link records
within their own systems.

### [Length of Vaccine Availability](https://covid.cdc.gov/covid-data-tracker/#vaccinations_vacc-total-admin-count-total)

This data was collected by the CDC in which it highlights the covid-19
vaccinations distribution per state. It includes the number of people
receiving at least one dose, the number of people who are fully
vaccinated, and the number of people with an updated (bivalent) booster
dose based on information reported to CDC on dose number, dose
manufacturer, administration date, recipient ID, and date of submission.
This dataset was last updated on May 10th, 2023.

### [Length of Masking Requirement](https://ballotpedia.org/State-level_mask_requirements_in_response_to_the_coronavirus_(COVID-19)_pandemic,_2020-2022)

This dataset highlights the duration (in days) of masking requirements
per state in response to the COVID-19 pandemic. The data was obtained
from the Ballotpedia website, where researchers gathered information
from each state’s local website. The dataset was last updated on April
30th, 2022. It includes the start date, end date, and the type of order
that terminated the state requirement. The termination reasons encompass
executive orders, court orders, and legislative actions. Throughout the
pandemic, some states adjusted their masking requirements or had
temporary pauses, which are also indicated in the dataset.

### [Gathering Restrictions (Max Length)](https://healthdata.gov/dataset/U-S-State-and-Territorial-Gathering-Bans-March-11-/8tfm-md2h/data?no_mobile=true%E2%80%8B)

The variable “Gathering Restrictions (max length)” was derived from the
gathering bans dataset obtained from the Health Data Gov. website. This
dataset provides information on gathering restrictions at the county
level in each state. The “max length” variable was created by
calculating the longest duration, in terms of days, of gathering bans or
limitations within any county in each state. This includes both complete
bans on gatherings and restrictions on the size of gatherings, such as a
limit on gatherings larger than six people. Health Data Gov. collected
this data by referring to the local government websites of each county
or state.

### [Average Salary per State](https://www.statista.com/statistics/243850/private-industry-wages-per-employee-in-the-us-by-state/)

\[**TODO**\]

### [Healthcare Rank](https://www.usnews.com/news/best-states/articles/methodology)

The data for the health rankings of each state was obtained from the
U.S. News 2021 rankings. This dataset provides a ranking from 1 to 50
for each state based on various factors, including health care access,
healthcare quality, and public health. U.S. News calculates an overall
ranking for each state by considering these factors. To ensure
comparability between states, U.S. News utilizes a z-score distribution
to scale each state’s ranking relative to all other states.

The metric-level results within the dataset range from 0 to 100, where
the state with the best performance receives a score of 100, and the
state with the worst performance receives a score of 0. All other states
are then scaled proportionally between these two extremes. This scaling
process allows for a standardized comparison of states’ performances
across the metrics.

The data collection process involved surveying a random sample of 20 to
26 thousand Americans over three years. The survey included questions
specifically related to the weighed categories used in the rankings.
Respondents’ answers were weighted based on their ranking of healthcare
importance in their respective states, ranging from one to eight. The
results were also weighted to ensure representation of the country’s
population across various demographics, including age, gender,
ethnicity, and household income.

In addition to the survey data, the health rankings incorporate data
sourced from local and government data agencies. These agencies provide
specific information related to the three metrics that contribute to
each state’s health ranking. The following is a list of each
sub-variable in the central three metrics mentioned above:

#### Health Care Access:

<div style="border: 1px solid #ddd; padding: 5px; ">

<table class="table table-striped table-hover lightable-classic lightable-paper" style="width: auto !important; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Sub-Variable
</th>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Source
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Population Without Health Insurance
</td>
<td style="text-align:left;">
U.S. Census Bureau American Community Survey
</td>
</tr>
<tr>
<td style="text-align:left;">
Child Dental Visits
</td>
<td style="text-align:left;">
Centers for Medicare & Medicaid Services
</td>
</tr>
<tr>
<td style="text-align:left;">
Child Wellness Visits
</td>
<td style="text-align:left;">
Centers for Medicare & Medicaid Services
</td>
</tr>
<tr>
<td style="text-align:left;">
Adults Without Dental Visit
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Adults Without Wellness Visit
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Adults Deterred From
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
</tbody>
</table>

</div>

#### Health Care Quality:

<div style="border: 1px solid #ddd; padding: 5px; ">

<table class="table table-striped table-hover lightable-classic lightable-paper" style="width: auto !important; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Sub-Variable
</th>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Source
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Preventable Hospital Admissions
</td>
<td style="text-align:left;">
Centers for Medicare & Medicaid Services
</td>
</tr>
<tr>
<td style="text-align:left;">
Medicare Enrollees With Top-Quality Coverage
</td>
<td style="text-align:left;">
Centers for Medicare & Medicaid Services
</td>
</tr>
<tr>
<td style="text-align:left;">
Nursing Home Quality Rating
</td>
<td style="text-align:left;">
U.S. News Best Nursing Homes
</td>
</tr>
<tr>
<td style="text-align:left;">
Hospital Quality Rating
</td>
<td style="text-align:left;">
U.S. News Best Hospitals
</td>
</tr>
</tbody>
</table>

</div>

#### Public Health:

<div style="border: 1px solid #ddd; padding: 5px; ">

<table class="table table-striped table-hover lightable-classic lightable-paper" style="width: auto !important; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Sub-Variable
</th>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Source
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Infant Mortality Rate
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Mortality Rate
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Obesity Rate
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Smoking Rate
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Poor Mental Health
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention Centers for Disease Control
and Prevention
</td>
</tr>
<tr>
<td style="text-align:left;">
Suicide Rate
</td>
<td style="text-align:left;">
Centers for Disease Control and Prevention
</td>
</tr>
</tbody>
</table>

</div>

### [Proportion of Democratic Voters]()

\[**TODO**\]

### [Rate of Jobs that went Remote](https://www.teamflowhq.com/blog/states-where-the-most-people-worked-remote-because-of-covid-19)

This data was collected by the U.S. Census Bureau’s Household Pulse
Survey in 2021. This data was collected from mid-April when vaccines
first became available to all adults through early July when cases began
to rise again. It includes the ranks of each state, the proportion of
remote workers, Percentage of Adults in households with a remote worker,
Total adults in households with a remote worker, Percentage of adults in
households with expected income loss, Percentage of adults in households
with difficulty paying expenses, and the median household income in each
state.

To determine the states where the most people worked remotely because of
COVID-19, researchers used data from this survey to calculate the
percentage of adults in households where at least one adult worked from
home because of the coronavirus pandemic in the past seven days,
averaged over the survey weeks during which this question was asked.
Notably, this only includes those who worked remotely because of the
pandemic, and not those that would have done so regardless. In the event
of a tie, the state with the higher number of adults in these households
was ranked higher.

## Key Statistical Tests

### Hypothesis Testing

In our analysis, hypothesis testing was employed to assess the existence
of a correlation between the proportion of low-income jobs lost and each
variable under consideration. In all the tests conducted, we utilized an
alpha value of 0.05 as the threshold for determining statistical
significance, assuming that a correlation exists between the variables.

The null hypothesis
(![H_0](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;H_0 "H_0"))
for all the tests posits that there is no correlation between the
variable being examined and the proportion of low-income jobs lost. On
the other hand, the alternative hypothesis
(![H_A](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;H_A "H_A"))
for all the tests assumes the presence of a meaningful statistical
relationship between the variable and the proportion of low-income jobs
lost.

### Principal Component Analysis

Using the Principal Component Analysis, we were able to bring our seven
interrelated variables down to fewer variables that still accounted for
a lot of the variability with the explanatory variable. Using
standardization, we were able to put all of the variables on even
footing to ensure that no variable had more weight than another. Our
goal with this was to create a more reasonable model that gave the data
room to be unaffected by collinearity. By using the Principal Component
Analysis, we were able to create a model that predicted low-income job
loss based on two completely independent variables. In the end, we
created a model that accounted for 91.8% of the variability in the
explanatory variables. It is important that when trying to predict using
this model to plug in standardized versions to ensure that all variables
are properly accounted for.

<div style="border: 1px solid #ddd; padding: 5px; ">

<table class="table table-striped table-hover lightable-classic lightable-paper" style="width: auto !important; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Variable
</th>
<th style="text-align:right;font-weight: bold;color: white !important;background-color: black !important;">
Component.1
</th>
<th style="text-align:right;font-weight: bold;color: white !important;background-color: black !important;">
Component.2
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Health Care Rank 2021
</td>
<td style="text-align:right;">
0.4823600
</td>
<td style="text-align:right;">
0.2171760
</td>
</tr>
<tr>
<td style="text-align:left;">
Doses of the COVID-19 Vaccine Administered
</td>
<td style="text-align:right;">
0.5457653
</td>
<td style="text-align:right;">
0.0055414
</td>
</tr>
<tr>
<td style="text-align:left;">
Proportion of Remote Workers
</td>
<td style="text-align:right;">
0.4302982
</td>
<td style="text-align:right;">
0.2631510
</td>
</tr>
<tr>
<td style="text-align:left;">
Total Days of Mask Mandate
</td>
<td style="text-align:right;">
0.1973234
</td>
<td style="text-align:right;">
-0.4021186
</td>
</tr>
<tr>
<td style="text-align:left;">
Annual Income Difference Between 2018 and 2021
</td>
<td style="text-align:right;">
-0.3523650
</td>
<td style="text-align:right;">
0.5094608
</td>
</tr>
<tr>
<td style="text-align:left;">
Proportion of Democratic Voters in the 2020 Election
</td>
<td style="text-align:right;">
0.3854622
</td>
<td style="text-align:right;">
0.0170180
</td>
</tr>
<tr>
<td style="text-align:left;">
Gathering Size Ban
</td>
<td style="text-align:right;">
0.0072112
</td>
<td style="text-align:right;">
-0.6797177
</td>
</tr>
</tbody>
</table>

</div>

## Results

### Hypothesis Testing

#### Summary of Results

\[**TODO**\]

<div style="border: 1px solid #ddd; padding: 5px; ">

<table class="table table-striped table-hover lightable-classic lightable-paper" style="width: auto !important; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; margin-left: auto; margin-right: auto; font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Variable​​
</th>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
P-Value​​
</th>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Correlation​.Coefficient ​​
</th>
<th style="text-align:left;font-weight: bold;color: white !important;background-color: black !important;">
Relationship.With.PLIJs.Lost​​
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
​Rate of Vaccination​
</td>
<td style="text-align:left;">
​1.497 × 10-5​
</td>
<td style="text-align:left;">
​0.57​
</td>
<td style="text-align:left;">
​Moderate & Positive (Rate of Vaccination ↑, PLIJs Lost ↑) ​
</td>
</tr>
<tr>
<td style="text-align:left;">
​Length of Vaccine Availability​
</td>
<td style="text-align:left;">
​6.24 x 10-6  ​
</td>
<td style="text-align:left;">
​0.60​
</td>
<td style="text-align:left;">
​Moderate & Positive (Length of Vaccine Availability ↑, PLIJs Lost ↑) ​
</td>
</tr>
<tr>
<td style="text-align:left;">
Length of Masking Requirement​​
</td>
<td style="text-align:left;">
1.929 x 10⁻⁷​​
</td>
<td style="text-align:left;">
0.7​0​
</td>
<td style="text-align:left;">
Strong & Positive (Length of Requirements ↑, PLIJs Lost ↑)​​
</td>
</tr>
<tr>
<td style="text-align:left;">
Gathering Restrictions (Max Length)
</td>
<td style="text-align:left;">
0.0009606​​
</td>
<td style="text-align:left;">
0.45​​
</td>
<td style="text-align:left;">
Moderate & Positive (Length of Gathering Restrictions ↑, PLIJs Lost ↑)​​
</td>
</tr>
<tr>
<td style="text-align:left;">
​Average Salary (per state, 2021)​
</td>
<td style="text-align:left;">
0.00113​​
</td>
<td style="text-align:left;">
​0.45​
</td>
<td style="text-align:left;">
​Moderate & Positive (Average Salary ↑, PLIJs Lost ↑)​
</td>
</tr>
<tr>
<td style="text-align:left;">
Healthcare Rank (2021)​​
</td>
<td style="text-align:left;">
0.001125​​
</td>
<td style="text-align:left;">
-0.5​0​
</td>
<td style="text-align:left;">
Moderate & Negative (Healthcare rank ↑, PLIJs Lost ↓)​​
</td>
</tr>
<tr>
<td style="text-align:left;">
Proportion of Democratic Voters (2020)​
</td>
<td style="text-align:left;">
1.909 × 10-6​
</td>
<td style="text-align:left;">
0.61
</td>
<td style="text-align:left;">
Strong & Positive (Prop. of Democratic voters ↑, PLIJs Lost ↑) ​
</td>
</tr>
<tr>
<td style="text-align:left;">
​Rate of Jobs that went Remote​
</td>
<td style="text-align:left;">
​ 0.04745​
</td>
<td style="text-align:left;">
​0.29​
</td>
<td style="text-align:left;">
​Weak & Positive (Rate of Jobs that went Remote ↑, PLIJs Lost ↑) ​
</td>
</tr>
</tbody>
</table>

</div>

#### [Rate of Vaccination](https://covid.cdc.gov/covid-data-tracker/#vaccinations_vacc-total-admin-count-total)

When conducting a hypothesis test to examine the relationship between
the estimated proportion of low-income jobs lost due to COVID-19 and the
Rate of Vaccinations by state, the obtained p-value of 1.497 × 10-5 in
which we reject the null hypothesis & correlation coefficient is 0.57.

These results signify a moderate positive correlation between the
proportion of low-income jobs lost per state (by population) and the
length of vaccine availability in the U.S (by each state). Furthermore,
the 95% confidence interval of (0.3702306, 0.7418059) does not include
0, which further supports the conclusion that there is a relationship
between these variables. This tells us that the more vaccination rates
were administered & distributed, the more jobs were loss due to covid
vaccination regulations and many companies or businesses started to
require these doses which could have led to some complications.

This graph below represents the relationship between the rate of
vaccinations (Total Doses Administered per state) and the proportion of
jobs loss. What does this mean? Certain states either pushed for
vaccinations less compared to others or the citizens of the states were
not interested in getting vaccinated. Does that mean the less strict a
state is, the fewer jobs it lost? You would assume that if a state is
stricter, then they would be able to reopen businesses faster, thus
losing less workers? Many businesses & states pushed for vaccinations &
probably made it mandatory to work so that is why some states have more
vaccinations administered.

#### [Length of Vaccine Availability](https://covid.cdc.gov/covid-data-tracker/#vaccinations_vacc-total-admin-count-total)

Before doing the hypothesis testing, I had to compute the proportion of
people who are vaccinated vs proportion of low income jobs lost in which
we divided the percent total population with a completed series to
examine the relationship between the estimated proportion of low-income
jobs lost due to COVID-19 and the Length of Vaccine Availability (by
each state, the obtained p-value of 6.24 x 10-6 in which we reject the
null hypothesis & correlation coefficient is 0.60.

These results signify a moderate positive correlation between the
proportion of low-income jobs lost per state (by population) and the
length of vaccine availability in the U.S (by each state). Furthermore,
the 95% confidence interval of (0.3702306, 0.7418059) does not include
0, which further supports the conclusion that there is a relationship
between these variables.

In this graph, we wanted to highlight duration of vaccine availability.
If the availability and distribution of vaccines are delayed or
prolonged, it can extend the duration of the COVID-19 pandemic. This, in
turn, can have severe economic consequences, including business
closures, reduced consumer spending, and job losses across various
sectors. Low-income workers are often employed in industries that have
been disproportionately affected by the pandemic, such as hospitality,
retail, and personal services, making them particularly vulnerable to
job losses. Also, this issue can result in shifts and changes within
industries. Some businesses may struggle to sustain their operations for
an extended period, leading to closures or downsizing. This can lead to
job losses, particularly for low-income workers employed in sectors that
are heavily impacted and unable to adapt to changing market conditions.

#### [Gathering Restrictions (Max Length)](https://healthdata.gov/dataset/U-S-State-and-Territorial-Gathering-Bans-March-11-/8tfm-md2h/data?no_mobile=true%E2%80%8B)

Hypothesis testing between the max gathering bans variable and
low-income jobs lost provided a p-value and correlation coefficient of
9.6\*10^(-4) and 0.45, respectively. Based on these findings, we
conclude that there is a positive and moderate correlation between the
two variables. In other words, an increase in the duration of gathering
restrictions is associated with a higher proportion of low-income jobs
lost.

The visual below illustrates the relationship between these variables.
The plot is arranged in descending order of the proportion of low-income
jobs lost in each state, ranging from high to low. It can be observed
that states with longer gathering restrictions tend to exhibit a higher
proportion of low-income jobs lost. Due to the moderate correlation
between the variables, discerning the pattern in such a plot can be
challenging compared to, for instance, the duration of masking
requirements.

#### [Average Salary per State](https://www.statista.com/statistics/243850/private-industry-wages-per-employee-in-the-us-by-state/)

\[**TODO**\]

#### [Healthcare Rank](https://www.usnews.com/news/best-states/articles/methodology)

Hypothesis testing between the health rank of each state and low-income
jobs lost provided a p-value and correlation coefficient of 1.1\*10^(-3)
and -0.50, respectively. Based on these findings, we conclude that there
is a negative and moderate correlation between the two variables. In
other words, a decrease in the health rank of a state is associated with
a lower proportion of low-income jobs lost.

#### [Proportion of Democratic Voters]()

\[**TODO**\]

#### [Rate of Jobs that went Remote](https://www.teamflowhq.com/blog/states-where-the-most-people-worked-remote-because-of-covid-19)

When conducting a hypothesis test to examine the relationship between
the estimated proportion of low-income jobs lost due to COVID-19 and the
Rate of Jobs that went Remote, the obtained p-value of 0.04745 in which
we reject the null hypothesis & correlation coefficient is 0.29.

These results signify a weak but positive correlation between the
proportion of low-income jobs lost per state (by population) and the
Proportion of jobs that went remote due to covid-19 in the U.S (by each
state). Furthermore, the 95% confidence interval of (0.003690818,
0.519365939) does not include 0, which further supports the conclusion
that there is a relationship between these variables. This tells us that
many people had to transition into remote jobs due to covid and could
have caused an increase in job loss due to strict covid regulations made
by many companies or businesses.

This graph shows the relationship between these two variables. We wanted
to highlight how big of an impact the covid-19 pandemic affected the
work industry in the U.S, how many people had to transition into doing
remote work, and how it also had an impact of people losing their jobs
as well. Remote work allows companies to hire employees from anywhere,
leading to increased competition for certain jobs. Low-income workers
who were previously employed in industries that are now remote-capable
may face difficulties in securing remote positions. Another thing is
that the shift to remote work can trigger broader structural changes in
industries. For instance, reduced demand for office space, business
travel, or in-person services can lead to downsizing or closures of
businesses that predominantly employ low-income workers. The transition
to remote work may not be feasible for industries that heavily rely on
face-to-face interactions or physical presence.

#### PCA

\[**TODO**\]

## Discussion

\[**TODO**\]

<!--
## Including Code

You can include R code in the document as follows:


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

## Including Plots

You can also embed plots, for example:



Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
-->
