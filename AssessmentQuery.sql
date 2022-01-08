SELECT
	b.Business
	,COALESCE(p.StreetNo,'') AS StreetNo
	,p.Street
	,p.PostCode
	,COALESCE(SUM(f.[Count]),0) AS FootfallCount
FROM Businesses b WITH (NOLOCK)
	LEFT JOIN Premises p WITH (NOLOCK)
	ON b.Id = p.BusinessId
		LEFT JOIN Footfall f WITH (NOLOCK)
		ON p.Id = f.PremisesId
GROUP BY b.Business
	,p.StreetNo
	,p.Street
	,p.PostCode



