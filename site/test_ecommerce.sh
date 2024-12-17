#!/bin/bash

# Define the URL and expected files to test
URL="http://localhost:9090"
FILES=("index.html")  # Replace with the actual files on your static site

# Start testing
echo "Running tests on the Docker container..."

# Test the homepage
echo "Testing homepage..."
if curl -I "$URL" 2>/dev/null | grep -q "200 OK"; then
  echo "Homepage is accessible."
  else
    echo "Homepage is NOT accessible."
      exit 1
      fi

      # Test each specific file
      for file in "${FILES[@]}"; do
        echo "Testing $file..."
          if curl -I "$URL/$file" 2>/dev/null | grep -q "200 OK"; then
              echo "$file is accessible."
                else
                    echo "$file is NOT accessible."
                        exit 1
                          fi
                          done

                          echo "All tests passed."

                          # Check logs for errors
                          if docker logs $1 | grep -i "error"; then
                            echo "Errors found in logs."
                              exit 1
                              else
                                echo "No errors in logs."
                                fi
                                #                                # Clean up by stopping the container
                                docker stop $1
                                docker rm $1

