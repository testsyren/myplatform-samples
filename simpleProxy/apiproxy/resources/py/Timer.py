response_time = flow.getVariable("target.received.start.timestamp") - flow.getVariable("target.sent.start.timestamp");
response.setVariable("header.X-Apigee-target", flow.getVariable("target.url"));
response.setVariable("header.X-Apigee-start-time", flow.getVariable("target.sent.start.time"));
response.setVariable("header.X-Apigee-start-timestamp", flow.getVariable("target.sent.start.timestamp"));
response.setVariable("header.X-Apigee-end-time", flow.getVariable("target.sent.end.time"));
response.setVariable("header.X-Apigee-end-timestamp", flow.getVariable("target.received.start.timestamp"));
response.setVariable("header.X-Apigee-target-responseTime", response_time);