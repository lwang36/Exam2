#1

library(pheatmap)
library(RColorBrewer)

data <- read.csv(file = "C:/Users/Ling/Desktop/Exam2data.csv")

rnames <- data[,1] 


mat_data <- data.matrix(data[,2:ncol(data)]) 

rownames(mat_data) <- rnames                 


my_palette <- colorRampPalette(c("orange","green","blue"))(n=299)


png("C:/Users/Ling/Desktop/Exam2_heatmap.png",width=5*300,height=5*300,res=300,
	pointsize=8) 

annotation <- data.frame(colnames(mat_data))
rownames(annotation) <- colnames(mat_data)

pheatmap(mat_data, main="Final exam plot", notecol="black", margins=c(12, 9),
	    col=my_palette, dendrogram="row",annotation = annotation)

distance = dist(mat_data, method = "manhattan") 
distance 
cluster = hclust(distance, method = "ward")
cluster

dev.off()

#2
gplots

library(gplots)
library(RColorBrewer)

data <- read.csv(file = "C:/Users/Ling/Desktop/Exam2data.csv")
data
rnames <- data[,1]                             
mat_data <- data.matrix(data[,2:ncol(data)])
rownames(mat_data) <- rnames                 

my_palette <- colorRampPalette(c("orange","green","blue"))(n=299)


png("C:/Users/Ling/Desktop/Exam2_heatmap_1.png",
	width=5*300,
	height=5*300,
	res=300,
	pointsize=8
) 

heatmap.2(mat_data, main="Final exam plot", notecol="black", margins=c(12, 9),
	    col=my_palette, dendrogram="row")

distance = dist(mat_data, method = "manhattan")
distance 
cluster = hclust(distance, method = "ward")							   
cluster

heatmap.2(mat_data, Rowv = as.dendrogram(cluster))
   
par(lend = 1)           
legend("topright",      
    legend = c("With.Estrogen", "With.Progesterone","With.Oxacillin", "With.Spermidine"),
    col = c("red", "blue", "yellow","pink"),  
    lty= 1,             
    lwd = 10            
)

dev.off()



