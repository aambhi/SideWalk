USE [SWPost]
GO
/****** Object:  StoredProcedure [dbo].[getContractorDetailsByName]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[getContractorDetailsByName]
@name nvarchar(50)
As
Begin
     select * from sw_contractor where contractor_id=@name
End
GO
/****** Object:  StoredProcedure [dbo].[getContractorDetailsByCCBNumber]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getContractorDetailsByCCBNumber]
@ccbNumber nvarchar(50)
As
Begin
     select license_number,business_name,address,city,[state],zip,business_telephone,rmi_name from CCB_DAILY_LICENSES where license_number=@ccbNumber
End
GO
/****** Object:  StoredProcedure [dbo].[getContractorByKeyword]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getContractorByKeyword] 
@keyword nvarchar(50)
As
Begin
     select license_number,business_name,address,city,[state],zip,business_telephone,rmi_name from CCB_DAILY_LICENSES where license_number like '%'+@keyword+'%' or business_name like '%'+@keyword+'%'
End
GO
/****** Object:  StoredProcedure [dbo].[getAffidavitList]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[getAffidavitList] 
As
Begin
     select * from sw_posting
End
GO
/****** Object:  StoredProcedure [dbo].[getAffidavitDetails]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[getAffidavitDetails]
@affidavitId nvarchar(50)
As
Begin
     select * from sw_posting where aff_no=@affidavitId
End
GO
/****** Object:  StoredProcedure [dbo].[getAffidavitCostDetails]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAffidavitCostDetails]
@affidavitId nvarchar(50),
@costTypeKey nvarchar(50)
As
Begin
select * from sw_action_detail where aff_no=@affidavitId and [action]=@costTypeKey
end
GO
/****** Object:  StoredProcedure [dbo].[getAffidavitByKeyword]    Script Date: 10/09/2016 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getAffidavitByKeyword] 
@keyword nvarchar(50)
As
Begin
     select * from sw_posting where (aff_no like '%'+@keyword+'' or st_no like '%'+@keyword+'' or (district) like ' @keyword' or (st_name) like '%'+@keyword+'') and (status) like 'A' and (date_issued) is NULL
     End
GO
