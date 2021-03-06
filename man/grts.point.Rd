% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grts.point.r
\name{grts.point}
\alias{grts.point}
\title{Draw a equi-probable GRTS sample from a discrete (point) resource.}
\usage{
grts.point(x, n, over.n = 0)
}
\arguments{
\item{x}{A \code{SpatialPoints} or \code{SpatialPointsDataFrame} object.}

\item{n}{Sample size.  The number of sample points to draw from \code{x}}

\item{over.n}{Over-sample size.  The number of 'over-sample' points to draw
from \code{x}.  The actual number of points drawn from \code{x} is
\code{n + over.n}.}
}
\value{
A \code{SpatialPointsDataFrame} containing locations in the GRTS sample, in
order they are to be visited.  Attributes of the sample points (in the embedded data frame) are 
as follows: 
\itemize{
  \item \code{sampleID}: Unique identifier for sample points. This 
  encodes the GRTS ordering of the sample.  The output object
  comes pre-sorted in GRTS order.  
  If the sample  becomes un-GRTS-ordered, resort 
  by \code{sampleID} (i.e., \code{samp <- samp[order(samp$sampleID),]}). 
  \item \code{pointType}: A string identifying regular sample points (\code{pointType=="Sample"})
  and over-sample points (\code{pointType=="OverSample"}).
  \item \code{geometryID}: The ID of the point in \code{x} which was sampled.  The 
  ID of points in \code{x} are \code{row.names(} \code{geometry(x))}. 
  \item Any attributes of the original points (in \code{x}). 
}
}
\description{
Draws an equi-probable unstratified Generalized Random
Tessellation Stratified (GRTS) sample from a \code{SpatialPoints*} object
}
\details{
This is a wrapper for the \code{grts} function in package \code{spsurvey}.
This simplifies calling \code{grts} when equi-probable samples are 
desired. It extends the valid input frame types to \code{SpatialPoints} objects 
(i.e., no attributes),
rather than just \code{SpatialPointsDataFrame} objects. For more 
complicated designs (e.g., variable probability, stratification), call 
\code{grts} directly.
}
\examples{


#   Draw sample
WA.city.samp <- grts.point(WA.cities,100,50)

#   Plot
plot( WA.cities, pch=16, cex=.5 )

# Plot 'sample' locations
plot( WA.city.samp[ WA.city.samp$pointType == "Sample", ], pch=1, add=TRUE, col="red" )  

# Plot 'over sample' locations
plot( WA.city.samp[ WA.city.samp$pointType == "OverSample", ], pch=2, add=TRUE, col="blue" )  


}
\references{
Stevens, D. L. and A. R. Olsen (1999). Spatially restricted
surveys over time for aquatic resources. Journal of Agricultural,
Biological, and Environmental Statistics 4 (4), 415-428.

Stevens, D. L. and A. R. Olsen (2004). Spatially balanced sampling of
natural resources. Journal of the American Statistical Association 99,
262-278.
}
\seealso{
\code{\link{grts.line}}, \code{\link{grts.polygon}}, \code{\link{hip.point}},
 \code{\link{sdraw}}
}
\author{
Trent McDonald
}
\keyword{design}
\keyword{survey}
