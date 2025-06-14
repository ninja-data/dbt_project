Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

#### conf file:
- ~/.dbt/profiles.yml

#### bash command:
- dbt init dbt_project_name
- dbt debug
- dbt build
- dbt run --select stg_flights__aircrafts


- Build dbt Model: > Executing task: dbt build --select stg_flights__aircrafts --project-dir /Users/nijat/fun/dbt-demo/dbt_course_practice --profiles-dir /Users/nijat/.dbt
- dbt source freshness
- dbt build --select stg_flights__bookings --log-level debug
- dbt build --select stg_flights__bookings --log-level debug --full-refresh (if add new columns)

- dbt docs generate
- dbt docs serve


> dbt run — Runs the models you defined in your project

> dbt build — Builds and tests your selected resources such as models, seeds, snapshots, and tests

> dbt test — Executes the tests you defined for your project

- dbt build -s stg_flights__bookings --full-refresh

- dbt seed -s city_region

- dbt run --select city_region+

- dbt build --select city_region+ 

- dbt seed --full-refresh