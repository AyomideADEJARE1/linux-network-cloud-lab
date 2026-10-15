# Test Results

Date: Thu Oct 15 19:21:17 WAT 2026

## Container status
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                     NAMES
418b6c736120   nginx:alpine   "/docker-entrypoint.…"   4 minutes ago   Up 4 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   linux-network-cloud-lab

## HTTP response
HTTP status: 200

## DNS resolution
172.66.147.243  STREAM example.com
172.66.147.243  DGRAM  
172.66.147.243  RAW    
104.20.23.154   STREAM 

## File permissions
-rw-r----- 1 ayo ayo 27 Oct 15 19:21 docs/permissions-demo/example.txt

## AWS EC2 Deployment Verification

- Date: 2026-10-15
- Deployment: AWS EC2 with Docker and Nginx
- Container: linux-network-cloud-lab
- Port mapping: EC2 TCP 8081 to container TCP 80
- Local EC2 HTTP test: PASS (HTTP 200 OK)
- External HTTP test: PASS (HTTP 200 OK)
- Existing application: Kept in its original containers and ports
