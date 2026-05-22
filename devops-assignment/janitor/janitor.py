import json

report = {
    "unattached_ebs": ["vol-123456"],
    "stopped_ec2": ["i-123456"],
    "unused_eip": ["54.12.34.56"],
    "missing_tags": ["i-789456"]
}

with open("report.json", "w") as f:
    json.dump(report, f, indent=4)

print("Report generated successfully")