orig = img  = readNIfTI("113-01-MPRAGE.nii.gz")
symmetric_brain = function(img){
	dimg = dim(img)
	max.slice = dimg[1]	
	mid.slice = (max.slice+1)/2

	ow = w = which(img > 0, arr.ind=TRUE)
  	## 20 - then 160, 90 - 20 + 90
  	## if 160 then 90 - 160 + 90
	w[, 1] = 2 * mid.slice - w[,1]
	ind = which(w[, 1] > mid.slice & w[, 1] < max.slice &
		w[, 1] > 0)
	w = w[ ind, ]
	ow = ow[ind,]
	img[w] = img[ow]
	img = cal_img(img)
	img
}

symm = symmetric_brain(img)