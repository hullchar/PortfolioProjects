SELECT *
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null
ORDER BY 3, 4

INSERT INTO PortfolioProject.dbo.CovidDeaths (continent, location, population, total_cases, total_deaths, new_cases)
VALUES (NULL, NULL, NULL, NULL, NULL, NULL)

--SELECT *
--FROM PortfolioProject.dbo.CovidVaccinations
--ORDER BY 3, 4

-- Select Data that we are going to be using

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject.dbo.CovidDeaths
ORDER By 1, 2

-- Looking  at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract COVID in your country 

SELECT Location, date, total_cases, total_deaths, (CONVERT(float,total_deaths) / NULLIF(CONVERT(float, total_cases),0))*100 as DeathPercentage
FROM PortfolioProject.dbo.CovidDeaths
WHERE location like '%states%'
ORDER By 1, 2

-- Looking at Total Cases vs. Population
-- Shows what percentage of population of COVID

SELECT Location, date, total_cases, population, (CONVERT(float,total_cases) / NULLIF(CONVERT(float, population),0))*100 as InfectedPercentage
FROM PortfolioProject.dbo.CovidDeaths
--WHERE location like '%states%'
ORDER By 1, 2

-- Looking at countries with highest infection rate compared to Population

SELECT Location, population, MAX(CONVERT(float,total_cases)) as HighestInfectionCount, MAX(CONVERT(float,total_cases) / NULLIF(CONVERT(float, population),0))*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.CovidDeaths
GROUP BY Location, population
ORDER BY PercentPopulationInfected DESC

-- LET'S BREAK THINGS DOWN BY CONTINENT

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null
GROUP BY continent 
ORDER BY TotalDeathCount DESC

-- Showing Countries with Highest Death Count per population 

SELECT Location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount DESC


-- GLOBAL NUMBERS 

SELECT date, SUM(cast(new_cases as int)) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int)) / SUM(cast(new_cases as int))*100 as GlobalNumbers
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null
GROUP BY date
ORDER By 1, 2



SELECT *
FROM PortfolioProject.dbo.CovidVaccinations
INSERT INTO PortfolioProject.dbo.CovidVaccinations(continent, location, date, total_vaccinations)
VALUES (NULL, NULL, NULL, NULL)



--- Looking at Total Population vs Vaccination 

SELECT *
FROM PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated, (RollingPeopleVaccinated/population)*100
FROM PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 1, 2, 3


-- USE CTE 

With PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2, 3
)
SELECT *, (RollingPeopleVaccinated/population)*100 as RollingPercent
FROM PopvsVac


-- TEMP TABLE 

DROP TABLE if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime, 
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2, 3

SELECT *, (RollingPeopleVaccinated/population)*100 as RollingPercent
FROM #PercentPopulationVaccinated


--Creating View to store data for later visualizations

Create View #PercentPopulationVaccinated as 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2, 3

SELECT *
FROM #PercentPopulationVaccinated