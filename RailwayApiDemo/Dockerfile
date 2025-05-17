# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy only the csproj and restore dependencies
COPY RailwayApiDemo/*.csproj ./RailwayApiDemo/
RUN dotnet restore RailwayApiDemo/RailwayApiDemo.csproj

# Copy the full project and build
COPY . .
RUN dotnet publish RailwayApiDemo/RailwayApiDemo.csproj -c Release -o /out

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /out ./
ENTRYPOINT ["dotnet", "RailwayApiDemo.dll"]
