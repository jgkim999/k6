FROM grafana/k6
ENV K6_PROMETHEUS_RW_SERVER_URL=http://192.168.0.47:9090/api/v1/write
ENV K6_PROMETHEUS_RW_TREND_STATS=p(95),p(99),min,max
ENV K6_WEB_DASHBOARD=true
#ENV K6_PROMETHEUS_RW_TREND_AS_NATIVE_HISTOGRAM=true
COPY test.js /test.js

#CMD ["run", "-o experimental-prometheus-rw /test.js"]
# check prometheus curl -X POST http://localhost:9090/api/v1/write
ENTRYPOINT [ "k6", "run", "-o", "experimental-prometheus-rw", "/test.js", "--tag", "scenario=my-scenario" ]
