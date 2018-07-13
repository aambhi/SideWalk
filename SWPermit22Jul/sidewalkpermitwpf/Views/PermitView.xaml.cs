﻿using SidewalkPermitWPF.Helper;
using SidewalkPermitWPF.Model;
using SidewalkPermitWPF.ViewModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WPF.MDI;


namespace SidewalkPermitWPF.Views
{
    /// <summary>
    /// Description for Permit.
    /// </summary>
    public partial class PermitView : UserControl
    {
        /// <summary>
        /// Initializes a new instance of the Permit class.
        /// </summary>
        /// 
        List<string> contractorList = new List<string>();
        List<string> affidavitList = new List<string>();
        List<string> propertyList = new List<string>();
        List<AffidavitCart> cart = new List<AffidavitCart>();
        private readonly IDataService _dataService;
        MdiContainer _container;
        //string minFee;
        //string maxFee;


        public PermitView(MdiContainer container)
        {
            InitializeComponent();
            _dataService = new DataService();
            _container = container;
            rdoContractor.IsChecked = true;
            rdoAddress.IsChecked = true;
            chkLegal.IsChecked = false;
            btnSubmit.IsEnabled = false;
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {

        }

        private async void suggestionList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (suggestionList.ItemsSource != null)
            {
                suggestionList.Visibility = Visibility.Collapsed;
                txtContractorSearch.TextChanged -= new TextChangedEventHandler(txtContractorSearch_TextChanged);
                if (suggestionList.SelectedIndex != -1)
                {
                    txtContractorSearch.Text = suggestionList.SelectedItem.ToString();
                    var contractor = await _dataService.GetContractor(suggestionList.SelectedItem.ToString().Split(',')[0]);
                    //txtContractorID.Text = contractor.contractor_id;
                    txtCCBNumber.Text = contractor.license_number;
                    if (!string.IsNullOrEmpty(contractor.alias_name))
                    {
                        txtContractorName.Text = contractor.alias_name;
                    }
                    else
                    {
                        txtContractorName.Text = contractor.business_name;
                    }
                    //txtContractorContact.Text = contractor.rmi_name;
                    txtContractorAddress.Text = contractor.address;
                    txtContractorCity.Text = contractor.city;
                    txtContractorZip.Text = contractor.zip;
                    txtContractorState.Text = contractor.state;
                    txtContractorPhone.Text = contractor.business_telephone;
                }
                txtContractorSearch.TextChanged += new TextChangedEventHandler(txtContractorSearch_TextChanged);
            }
            //CheckForValidation();

        }

        private async void PropertySuggestionList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (PropertySuggestionList.ItemsSource != null)
            {
                chkLegal.IsEnabled = true;
                PropertySuggestionList.Visibility = Visibility.Collapsed;
                txtPropertySearch.TextChanged -= new TextChangedEventHandler(txtPropertySearch_TextChanged);
                if (PropertySuggestionList.SelectedIndex != -1)
                {
                    txtAffidavitSearch.Text = PropertySuggestionList.SelectedItem.ToString().Split('#')[0];
                    txtPropertySearch.Text = PropertySuggestionList.SelectedItem.ToString().Split('#')[1];
                    var affidavit = await _dataService.GetAffidavitByNumber(PropertySuggestionList.SelectedItem.ToString().Split('#')[0]);
                    if (affidavit.aff_no > 80000 && (bool)affidavit.NEW_ClearWalk)
                    {
                        btnSubmit.IsEnabled = false;
                        chkLegal.IsEnabled = false;
                        MessageBox.Show("This affidavit contains clear walk. It cannot be submitted for a permit.");
                    }
                    txtInspector.Text = (affidavit.inspector_name != null) ? affidavit.inspector_name.ToString() : string.Empty;
                    txtInspectionDate.Text = (affidavit.post_dt != null) ? affidavit.post_dt.Value.ToShortDateString() : string.Empty;
                    txtNoticeSent.Text = (affidavit.sent_dt != null) ? affidavit.sent_dt.Value.ToShortDateString() : string.Empty;
                    txtPropertyOwner.Text = affidavit.owner_name;
                    txtPropertyDescription.Text = affidavit.property_desc;
                    var affidavitCostsDetails = await _dataService.GetAffidavitCostDetails(affidavit.aff_no.ToString(), "R");
                    //if (affidavitCostsDetails.Count == 0)
                    //{
                    //    affidavitCostsDetails = await _dataService.GetAffidavitCostDetails(affidavit.aff_no.ToString(), "E");
                    //}
                    DateTime ExpirationDate = new DateTime();

                    DateTime affidavitDueDate = DateTime.MinValue;
                    DateTime calculatedDate = DateTime.Now.AddDays(30.00);
                    if (affidavit.NEW_RepairDueDate != null)
                    {
                        affidavitDueDate = (DateTime)affidavit.NEW_RepairDueDate;
                    }
                    else
                    {
                        affidavitDueDate = affidavit.post_dt.Value.AddDays(67.00);
                    }

                    if (calculatedDate > affidavitDueDate)
                    {
                        ExpirationDate = calculatedDate;
                    }
                    else
                    {
                        ExpirationDate = affidavitDueDate;
                    }

                    txtExpirationDate.Text = ExpirationDate.ToShortDateString();

                    string TotalFee = "0";
                    //btnSubmit.IsEnabled = true;
                    List<sw_action_detail> filteredCostDetails = new List<sw_action_detail>();
                    var rateList = await _dataService.GetRepairItemRate();
                    foreach (var item in affidavitCostsDetails)
                    {
                        try
                        {
                            if (item.aff_no <= 80000 && item.action_type == "Clear Walk")
                            {
                                btnSubmit.IsEnabled = false;
                                chkLegal.IsEnabled = false;
                                MessageBox.Show("This affidavit contains clear walk. It cannot be submitted for a permit.");
                            }
                            //else if (item.aff_no > 80000 && (bool)Affidavit.NEW_ClearWalk)
                            //{
                            //    btnSubmit.IsEnabled = false;
                            //    chkLegal.IsEnabled = false;
                            //    MessageBox.Show("Can’t submit an application because of clear walk");
                            //}
                            if (item.action_type.Equals(Constants.RepairItem_Sidewalk))
                            {
                                item.rate = (decimal)rateList.Where(x => x.Action_Type.Equals(Constants.RepairItem_Sidewalk)).FirstOrDefault().CurrentRate;
                                item.cost = decimal.Parse((item.unit * item.rate).ToString("0.00"));
                                TotalFee = (decimal.Parse(TotalFee) + (item.unit * item.rate)).ToString("0.00");
                                filteredCostDetails.Add(item);
                            }
                            if (item.action_type.Equals(Constants.RepairItem_Driveway))
                            {
                                item.rate = (decimal)rateList.Where(x => x.Action_Type.Equals(Constants.RepairItem_Driveway)).FirstOrDefault().CurrentRate;
                                item.cost = decimal.Parse((item.unit * item.rate).ToString("0.00"));
                                TotalFee = (decimal.Parse(TotalFee) + (item.unit * item.rate)).ToString("0.00");
                                filteredCostDetails.Add(item);
                            }
                            if (item.action_type.Contains("Curb"))
                            {
                                item.rate = (decimal)rateList.Where(x => x.Action_Type.Equals(Constants.RepairItem_Curbs)).FirstOrDefault().CurrentRate;
                                item.cost = decimal.Parse((item.unit * item.rate).ToString("0.00"));
                                TotalFee = (decimal.Parse(TotalFee) + (item.unit * item.rate)).ToString("0.00");
                                filteredCostDetails.Add(item);
                            }
                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }
                    var minmaxFee = await _dataService.GetPermitFee();
                    affidavitFee.ItemsSource = null;
                    affidavitFee.ItemsSource = filteredCostDetails;
                    txtMinFee.Text = double.Parse(minmaxFee.MinimumFee.ToString()).ToString("0.00");
                    txtMaxFee.Text = double.Parse(minmaxFee.MaximumFee.ToString()).ToString("0.00");

                    if (decimal.Parse(TotalFee) >= minmaxFee.MaximumFee)
                        TotalFee = minmaxFee.MaximumFee.Value.ToString();
                    else if (decimal.Parse(TotalFee) <= minmaxFee.MinimumFee)
                        TotalFee = minmaxFee.MinimumFee.Value.ToString();

                    //if (double.Parse(TotalFee) >= 500.00)
                    //    TotalFee = "500";
                    //else if (double.Parse(TotalFee) <= 60.00)
                    //    TotalFee = "60";
                    
                    txtFee.Text = double.Parse(TotalFee).ToString("0.00");
                    affidavitSuggestionList.Visibility = Visibility.Collapsed;
                    affidavitSuggestionList.ItemsSource = null;
                    //txtAffidavitSearch.IsEnabled = false;
                }
                txtPropertySearch.TextChanged += new TextChangedEventHandler(txtPropertySearch_TextChanged);
            }
            //CheckForValidation();
        }
        private async void affidavitSuggestionList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (affidavitSuggestionList.ItemsSource != null)
            {
                chkLegal.IsEnabled = true;
                affidavitSuggestionList.Visibility = Visibility.Collapsed;
                txtAffidavitSearch.TextChanged -= new TextChangedEventHandler(txtAffidavitSearch_TextChanged);
                if (affidavitSuggestionList.SelectedIndex != -1)
                {
                    txtAffidavitSearch.Text = affidavitSuggestionList.SelectedItem.ToString().Split('#')[0];
                    txtPropertySearch.Text = affidavitSuggestionList.SelectedItem.ToString().Split('#')[1];
                    var affidavit = await _dataService.GetAffidavitByNumber(affidavitSuggestionList.SelectedItem.ToString().Split('#')[0]);
                    if (affidavit.aff_no > 80000 && (bool)affidavit.NEW_ClearWalk)
                    {
                        btnSubmit.IsEnabled = false;
                        chkLegal.IsEnabled = false;
                        MessageBox.Show("This affidavit contains clear walk. It cannot be submitted for a permit.");
                    }
                    txtInspector.Text = (affidavit.inspector_name != null) ? affidavit.inspector_name.ToString() : string.Empty;
                    txtInspectionDate.Text = (affidavit.post_dt != null) ? affidavit.post_dt.Value.ToShortDateString() : string.Empty;
                    txtNoticeSent.Text = (affidavit.sent_dt != null) ? affidavit.sent_dt.Value.ToShortDateString() : string.Empty;
                    txtPropertyOwner.Text = affidavit.owner_name;
                    txtPropertyDescription.Text = affidavit.property_desc;
                    var affidavitCostsDetails = await _dataService.GetAffidavitCostDetails(affidavit.aff_no.ToString(), "R");
                    //if (affidavitCostsDetails.Count == 0)
                    //{
                    //    affidavitCostsDetails = await _dataService.GetAffidavitCostDetails(affidavit.aff_no.ToString(), "E");
                    //}
                    DateTime ExpirationDate = new DateTime();
                    DateTime affidavitDueDate = DateTime.MinValue;
                    DateTime calculatedDate = DateTime.Now.AddDays(30.00);
                    if (affidavit.NEW_RepairDueDate != null)
                    {
                        affidavitDueDate = (DateTime)affidavit.NEW_RepairDueDate;
                    }
                    else {
                        affidavitDueDate = affidavit.post_dt.Value.AddDays(67.00);
                    }

                    if (calculatedDate > affidavitDueDate)
                    {
                        ExpirationDate = calculatedDate;

                    }
                    else
                    {
                        ExpirationDate = affidavitDueDate;
                    }

                    txtExpirationDate.Text = ExpirationDate.ToShortDateString();

                    string TotalFee = "0.00";
                    //btnSubmit.IsEnabled = true;
                    List<sw_action_detail> filteredCostDetails = new List<sw_action_detail>();
                    var rateList = await _dataService.GetRepairItemRate();
                    foreach (var item in affidavitCostsDetails)
                    {
                        try
                        {
                            if (item.aff_no <= 80000 && item.action_type == "Clear Walk")
                            {
                                btnSubmit.IsEnabled = false;
                                chkLegal.IsEnabled = false;
                                MessageBox.Show("This affidavit contains clear walk. It cannot be submitted for a permit.");
                            }
                            if (item.action_type.Equals(Constants.RepairItem_Sidewalk))
                            {
                                item.rate = (decimal)rateList.Where(x => x.Action_Type.Equals(Constants.RepairItem_Sidewalk)).FirstOrDefault().CurrentRate;
                                item.cost = decimal.Parse((item.unit * item.rate).ToString("0.00"));
                                TotalFee = (decimal.Parse(TotalFee) + (item.unit * item.rate)).ToString("0.00");
                                filteredCostDetails.Add(item);
                            }
                            if (item.action_type.Equals(Constants.RepairItem_Driveway))
                            {
                                item.rate = (decimal)rateList.Where(x => x.Action_Type.Equals(Constants.RepairItem_Driveway)).FirstOrDefault().CurrentRate;
                                item.cost = decimal.Parse((item.unit * item.rate).ToString("0.00"));
                                TotalFee = (decimal.Parse(TotalFee) + (item.unit * item.rate)).ToString("0.00");
                                filteredCostDetails.Add(item);
                            }
                            if (item.action_type.Contains("Curb"))
                            {
                                item.rate = (decimal)rateList.Where(x => x.Action_Type.Equals(Constants.RepairItem_Curbs)).FirstOrDefault().CurrentRate;
                                item.cost = decimal.Parse((item.unit * item.rate).ToString("0.00"));
                                TotalFee = (decimal.Parse(TotalFee) + (item.unit * item.rate)).ToString("0.00");
                                filteredCostDetails.Add(item);
                            }
                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }

                    var minmaxFee = await _dataService.GetPermitFee();
                    affidavitFee.ItemsSource = null;
                    affidavitFee.ItemsSource = filteredCostDetails;
                    txtMinFee.Text = double.Parse(minmaxFee.MinimumFee.ToString()).ToString("0.00");
                    txtMaxFee.Text = double.Parse(minmaxFee.MaximumFee.ToString()).ToString("0.00");
                    if (decimal.Parse(TotalFee) >= minmaxFee.MaximumFee)
                        TotalFee = minmaxFee.MaximumFee.Value.ToString();
                    else if (decimal.Parse(TotalFee) <= minmaxFee.MinimumFee)
                        TotalFee = minmaxFee.MinimumFee.Value.ToString();

                    //affidavitFee.ItemsSource = null;
                    //affidavitFee.ItemsSource = filteredCostDetails;
                    //if (double.Parse(TotalFee) >= 500.00)
                    //    TotalFee = "500";
                    //else if (double.Parse(TotalFee) <= 60.00)
                    //    TotalFee = "60";
                    txtFee.Text = double.Parse(TotalFee).ToString("0.00");
                    //txtPropertySearch.IsEnabled = false;
                }
                txtAffidavitSearch.TextChanged += new TextChangedEventHandler(txtAffidavitSearch_TextChanged);
            }
            //CheckForValidation();
        }
        private async void txtContractorSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            contractorList.Clear();
            try
            {
                if (txtContractorSearch.Text.Length >= 3)
                {
                    var contractors = await _dataService.GetContractorByKeyword(txtContractorSearch.Text.Trim());
                    if (contractors.Count > 0)
                    {
                        foreach (var item in contractors)
                        {
                            contractorList.Add(string.Format("{0},{1}", item.license_number, (!string.IsNullOrEmpty(item.alias_name) ? item.alias_name : item.business_name)));
                        }
                        if (contractorList.Count > 0)
                        {
                            suggestionList.ItemsSource = null;
                            suggestionList.ItemsSource = contractorList;
                            suggestionList.Visibility = Visibility.Visible;
                        }
                    }
                    else
                    {
                        contractorList.Clear();
                        contractorList.Add("No results found or License Expired.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }

        }
        private async void txtAffidavitSearch_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
        public async void SearchAffidavit()
        {
            affidavitList.Clear();
            if (txtAffidavitSearch.Text.Length >= 3)
            {
                var affidavits = await _dataService.GetAffidavitByKeyword(txtAffidavitSearch.Text.Trim());
                if (affidavits != null && affidavits.Count > 0)
                {
                    foreach (var item in affidavits)
                    {
                        affidavitList.Add(string.Format("{0}# {1} {2} {3} {4}", item.aff_no, item.st_no.Trim(), item.district.Trim(), item.st_name.Trim(), item.designator.Trim()));
                    }
                    if (affidavitList.Count > 0)
                    {
                        affidavitSuggestionList.ItemsSource = null;
                        affidavitSuggestionList.ItemsSource = affidavitList;
                        affidavitSuggestionList.Visibility = Visibility.Visible;
                    }
                }
                else
                {
                    affidavitList.Clear();
                    affidavitList.Add("Affidavit is inactive or has a permit");
                }
            }
        }
        private void affidavitSuggestionList_KeyUp(object sender, KeyEventArgs e)
        {

        }

        private void txtAffidavitSearch_KeyUp(object sender, KeyEventArgs e)
        {
            SearchAffidavit();
            if (affidavitList.Count > 0)
            {
                affidavitSuggestionList.ItemsSource = null;
                affidavitSuggestionList.ItemsSource = affidavitList;
                affidavitSuggestionList.Visibility = Visibility.Visible;
            }
            else if (txtAffidavitSearch.Text.Equals(""))
            {
                affidavitSuggestionList.Visibility = Visibility.Collapsed;
                affidavitSuggestionList.ItemsSource = null;
            }
            else
            {
                affidavitSuggestionList.Visibility = Visibility.Collapsed;
                affidavitSuggestionList.ItemsSource = null;
            }
        }
        private bool CheckForValidation()
        {
            //need to write logic for validation
            if (!string.IsNullOrEmpty(txtContractorName.Text) && !string.IsNullOrEmpty(txtContractorPhone.Text) && !string.IsNullOrEmpty(txtAffidavitSearch.Text))
            {
                btnSubmit.IsEnabled = true;
            }
            else
            {
                btnSubmit.IsEnabled = false;
            }
            return btnSubmit.IsEnabled;
        }
        async void SubmitApplication()
        {
            if ((bool)chkLegal.IsChecked)
            {
                Permit isExistingPermit;
                //Permit isExistingPermitByAddress;
                //try
                //{
                if ((bool)rdoAffidavit.IsChecked)
                {
                    var isExistingPermitByAffidavit = await _dataService.GetPermitByAffidavit(long.Parse(txtAffidavitSearch.Text));
                    isExistingPermit = isExistingPermitByAffidavit;
                }
                else {
                    var isExistingPermitByAddress = await _dataService.GetPermitByAffidavit(long.Parse(txtAffidavitSearch.Text));
                    isExistingPermit = isExistingPermitByAddress;
                }
                if (isExistingPermit == null)
                //if (isExistingPermit == null || (!(isExistingPermit.PermitStatus== Constants.PermitStatus_Submitted) || !(isExistingPermit.PermitStatus == Constants.PermitStatus_Accepted)))
                {
                    Permit model = new Permit();
                    AffidavitCart cartItem = new AffidavitCart();
                    //Insert applicant type
                    PermitApplicant applicant = new PermitApplicant();
                    if ((bool)rdoContractor.IsChecked)
                    {
                        model.ApplicantType = "Contractor";
                        applicant.ApplicantType = "Contractor";
                    }
                    else if ((bool)rdoOwner.IsChecked)
                    {
                        model.ApplicantType = "Owner";
                        applicant.ApplicantType = "Owner";
                    }
                    else if ((bool)rdoOther.IsChecked)
                    {
                        model.ApplicantType = "Other";
                        applicant.ApplicantType = "Other";
                    }
                    applicant.Name = txtContractorName.Text;
                    applicant.Address = txtContractorAddress.Text;
                    applicant.Contact = txtContractorContact.Text;
                    applicant.City = txtContractorCity.Text;
                    applicant.Zip = txtContractorZip.Text;
                    applicant.State = txtContractorState.Text;
                    applicant.PhoneNumber = txtContractorPhone.Text;
                    //applicant.ContactPhoneNumber = txtContractorContactPhone.Text;
                    applicant.PermitID = 0;
                    applicant = await _dataService.InsertPermitApplicant(applicant);
                    //Insert permit
                    if ((bool)rdoAffidavit.IsChecked)
                    {
                        model.AffidavitID = long.Parse(txtAffidavitSearch.Text);
                        model.PropertyAddress = txtPropertySearch.Text;
                        cartItem.AffidavitID = txtAffidavitSearch.Text;
                        cartItem.PropertyAddress = txtPropertySearch.Text;
                    }
                    else
                    {
                        model.AffidavitID = long.Parse(txtAffidavitSearch.Text);
                        model.PropertyAddress = txtPropertySearch.Text;
                        cartItem.AffidavitID = txtAffidavitSearch.Text;
                        cartItem.PropertyAddress = txtPropertySearch.Text;
                    }

                    if (!string.IsNullOrEmpty(txtContractorSearch.Text))
                    {
                        model.ContractorID = txtContractorSearch.Text.Split(',')[1].ToString();
                    }
                    else
                    {
                        model.ContractorID = string.Empty;
                    }
                    model.ApplicantID = applicant.ApplicantID;
                    //
                    //model.PermitNo = Aff
                    model.PermitIssued = "No";
                    model.PermitExtended = "No";
                    model.BuilderBoardNo = txtCCBNumber.Text;
                    model.DateCancelled = null;
                    model.CancelledBy = string.Empty;
                    model.LastAction = "Application Submitted";
                    model.DateExpired = DateTime.Parse(txtExpirationDate.Text);
                    if ((bool)rdoContractor.IsChecked)
                    {
                        model.ApplicantType = "Contractor";
                    }
                    else if ((bool)rdoOwner.IsChecked)
                    {
                        model.ApplicantType = "Owner";
                        model.ContractorID = "PO";
                    }
                    else if ((bool)rdoOther.IsChecked)
                    {
                        model.ApplicantType = "Other";
                        model.ContractorID = "PO";
                    }
                    model.TotalFee = decimal.Parse(txtFee.Text);
                    model.PermitStatus = Constants.PermitStatus_Submitted;
                    model.SubmissionDate = DateTime.Now;

                    model = await _dataService.InsertPermit(model);
                    applicant.PermitID = model.PermitID;
                    var permitHistory = await _dataService.InsertPermitHistory(model.PermitID, "Submitted", "New permit applied.");
                    applicant = await _dataService.UpdatePermitApplicant(applicant);
                    int permitCount = int.Parse(lblAffidavitCount.Content.ToString());
                    lblAffidavitCount.Content = permitCount + 1;

                    cartItem.PermitID = model.PermitID.ToString();
                    cartItem.Remove = "Remove";
                    cart.Add(cartItem);
                    affidavitGrid.ItemsSource = null;
                    affidavitGrid.ItemsSource = cart;
                    var affidavitFeeList = (List<sw_action_detail>)affidavitFee.ItemsSource;
                    foreach (var item in affidavitFeeList)
                    {
                        var Affidavit = await _dataService.GetAffidavitByNumber(item.aff_no.ToString());
                        PermitCostsDetail permitCosts = new PermitCostsDetail();
                        permitCosts.AffidavitID = item.aff_no;
                        permitCosts.Cost = item.cost;
                        permitCosts.CostType = item.action_type;
                        permitCosts.Rate = item.rate;
                        permitCosts.Unit = item.unit;
                        permitCosts.RepairItem = item.action_type;

                        await _dataService.InsertPermitCostsDetail(permitCosts);
                    }
                    MessageBoxResult result = MessageBox.Show("Affidavit submitted successfully.  Do you want to apply for another permit?", "Confirmation", MessageBoxButton.YesNo);
                    if (result == MessageBoxResult.Yes)
                    {
                        ClearAffidavit();
                        chkLegal.IsChecked = false;
                    }
                    else
                    {

                        //if (!Convert.ToBoolean(ConfigurationManager.AppSettings["IsKiosk"].ToString()))
                        //{
                        //    MainWindow window = new MainWindow();
                        //    window.allPermitsOpen(_container);
                        //}
                        //else
                        //{
                        MainWindow window = new MainWindow();
                        window.newPermitOpen(_container);
                        //}
                    }
                }
                else
                {
                    MessageBox.Show("This affidavit has a permit pending for approval", "Permit Exist.");
                }
            }

            else
            {
                MessageBox.Show("Pls enter the Applicant, Name, Affidavit & agree to statement at the bottom");
            }
        }

        private void txtContractorSearch_KeyUp(object sender, KeyEventArgs e)
        {
            if (contractorList.Count > 0)
            {
                suggestionList.ItemsSource = null;
                suggestionList.ItemsSource = contractorList;
                suggestionList.Visibility = Visibility.Visible;
            }
            else if (txtContractorSearch.Text.Equals(""))
            {
                suggestionList.Visibility = Visibility.Collapsed;
                suggestionList.ItemsSource = null;
            }
            else
            {
                suggestionList.Visibility = Visibility.Collapsed;
                suggestionList.ItemsSource = null;
            }
        }

        private void chkLegal_Checked(object sender, RoutedEventArgs e)
        {
            CheckForValidation();
        }
        private void chkLegal_Unchecked(object sender, RoutedEventArgs e)
        {
            btnSubmit.IsEnabled = false;
        }
        private void btnSubmit_Click(object sender, RoutedEventArgs e)
        {
            this.IsEnabled = false;
            SubmitApplication();
            btnSubmit.IsEnabled = false;
            this.IsEnabled = true;
        }
        private void ClearAffidavit()
        {
            txtAffidavitSearch.Text = string.Empty;
            txtInspector.Text = string.Empty;
            txtInspectionDate.Text = string.Empty;
            txtNoticeSent.Text = string.Empty;
            txtPropertyOwner.Text = string.Empty;
            txtPropertyDescription.Text = string.Empty;
            affidavitFee.ItemsSource = null;
            txtFee.Text = string.Empty;
            txtExpirationDate.Text = string.Empty;
            txtPropertySearch.Text = string.Empty;
        }

        private void rdoContractor_Checked(object sender, RoutedEventArgs e)
        {
            if (txtContractorSearch != null)
            {
                if ((bool)rdoContractor.IsChecked)
                {
                    txtContractorSearch.IsEnabled = true;
                    txtCCBNumber.IsEnabled = false;
                    txtContractorName.IsEnabled = false;
                    txtContractorContact.IsEnabled = true;
                    txtContractorAddress.IsEnabled = false;
                    txtContractorCity.IsEnabled = false;
                    txtContractorState.IsEnabled = false;
                    txtContractorZip.IsEnabled = false;
                    txtContractorPhone.IsEnabled = true;


                    txtContractorSearch.Text = string.Empty;
                    txtCCBNumber.Text = string.Empty;
                    txtContractorName.Text = string.Empty;
                    txtContractorContact.Text = string.Empty;
                    txtContractorAddress.Text = string.Empty;
                    txtContractorCity.Text = string.Empty;
                    txtContractorState.Text = string.Empty;
                    txtContractorZip.Text = string.Empty;
                    txtContractorPhone.Text = string.Empty;

                }
            }
        }

        private void rdoOwner_Checked(object sender, RoutedEventArgs e)
        {
            txtContractorSearch.IsEnabled = false;
            txtCCBNumber.IsEnabled = false;
            txtContractorName.IsEnabled = true;
            txtContractorContact.IsEnabled = true;
            txtContractorAddress.IsEnabled = true;
            txtContractorCity.IsEnabled = true;
            txtContractorState.IsEnabled = true;
            txtContractorZip.IsEnabled = true;
            txtContractorPhone.IsEnabled = true;


            txtContractorSearch.Text = string.Empty;
            txtCCBNumber.Text = string.Empty;
            txtContractorName.Text = string.Empty;
            txtContractorContact.Text = string.Empty;
            txtContractorAddress.Text = string.Empty;
            txtContractorCity.Text = string.Empty;
            txtContractorState.Text = string.Empty;
            txtContractorZip.Text = string.Empty;
            txtContractorPhone.Text = string.Empty;

        }

        private void rdoOther_Checked(object sender, RoutedEventArgs e)
        {
            txtContractorSearch.IsEnabled = false;
            txtCCBNumber.IsEnabled = false;
            txtContractorName.IsEnabled = true;
            txtContractorContact.IsEnabled = true;
            txtContractorAddress.IsEnabled = true;
            txtContractorCity.IsEnabled = true;
            txtContractorState.IsEnabled = true;
            txtContractorZip.IsEnabled = true;
            txtContractorPhone.IsEnabled = true;


            txtContractorSearch.Text = string.Empty;
            txtCCBNumber.Text = string.Empty;
            txtContractorName.Text = string.Empty;
            txtContractorContact.Text = string.Empty;
            txtContractorAddress.Text = string.Empty;
            txtContractorCity.Text = string.Empty;
            txtContractorState.Text = string.Empty;
            txtContractorZip.Text = string.Empty;
            txtContractorPhone.Text = string.Empty;

        }

        private void EmailValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
            e.Handled = regex.IsMatch(e.Text);
        }
        private void LetterValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^A-Za-z]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void LettersAndNumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^A-Za-z0-9 ]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        private void PhoneNumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            //Regex regex = new Regex(" ^[1 - 9]\d{ 2} -\d{ 3} -\d{ 4}");
            Regex regex = new Regex("[^0-9,-]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void btnTopMenuHide_Click(object sender, RoutedEventArgs e)
        {
            ShowHideMenu("sbHideTopMenu", btnTopMenuHide, btnTopMenuShow, pnlTopMenu);
        }

        private void btnTopMenuShow_Click(object sender, RoutedEventArgs e)
        {
            ShowHideMenu("sbShowTopMenu", btnTopMenuHide, btnTopMenuShow, pnlTopMenu);
        }
        private void ShowHideMenu(string Storyboard, Button btnHide, Button btnShow, StackPanel pnl)
        {
            Storyboard sb = Resources[Storyboard] as Storyboard;
            sb.Begin(pnl);

            if (Storyboard.Contains("Show"))
            {
                btnHide.Visibility = System.Windows.Visibility.Visible;
                btnShow.Visibility = System.Windows.Visibility.Hidden;
            }
            else if (Storyboard.Contains("Hide"))
            {
                btnHide.Visibility = System.Windows.Visibility.Hidden;
                btnShow.Visibility = System.Windows.Visibility.Visible;
            }
        }

        private void OnHyperlinkClickRemoveAffidavit(object sender, RoutedEventArgs e)
        {
            var selectedItem = (AffidavitCart)((Hyperlink)e.OriginalSource).DataContext;
            _dataService.RemovePermit(long.Parse(selectedItem.PermitID));
            cart.Remove(selectedItem);
            affidavitGrid.ItemsSource = null;
            affidavitGrid.ItemsSource = cart;
            int permitCount = int.Parse(lblAffidavitCount.Content.ToString());
            lblAffidavitCount.Content = permitCount - 1;
        }

        private void affidavitGrid_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        private void txtContractorPhone_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private async void txtPropertySearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            //propertyList.Clear();
            //PropertySuggestionList.Visibility = Visibility.Collapsed;
            //if (txtPropertySearch.Text.Length >= 2)
            //{
            //    var affidavits = await _dataService.GetAffidavitByPropertyKeyword(txtPropertySearch.Text.Trim());
            //    if (affidavits != null && affidavits.Count > 0)
            //    {
            //        foreach (var item in affidavits)
            //        {
            //            propertyList.Add(string.Format("{0}# {1} {2} {3} {4}", item.aff_no, item.st_no.Trim(), item.district.Trim(), item.st_name.Trim(), item.designator.Trim()));
            //        }
            //        if (propertyList.Count > 0)
            //        {
            //            PropertySuggestionList.ItemsSource = null;
            //            PropertySuggestionList.ItemsSource = propertyList;
            //            PropertySuggestionList.Visibility = Visibility.Visible;
            //        }
            //    }
            //    else
            //    {
            //        propertyList.Clear();
            //        propertyList.Add("Affidavit is inactive or has a permit");
            //    }
        }

        public async void SearchProperty()
        {
            propertyList.Clear();
            PropertySuggestionList.Visibility = Visibility.Collapsed;
            if (txtPropertySearch.Text.Length >= 2)
            {
                var affidavits = await _dataService.GetAffidavitByPropertyKeyword(txtPropertySearch.Text.Trim());
                if (affidavits != null && affidavits.Count > 0)
                {
                    foreach (var item in affidavits)
                    {
                        propertyList.Add(string.Format("{0}# {1} {2} {3} {4}", item.aff_no, item.st_no.Trim(), item.district.Trim(), item.st_name.Trim(), item.designator.Trim()));
                    }
                    if (propertyList.Count > 0)
                    {
                        PropertySuggestionList.ItemsSource = null;
                        PropertySuggestionList.ItemsSource = propertyList;
                        PropertySuggestionList.Visibility = Visibility.Visible;
                    }
                }
                else
                {
                    propertyList.Clear();
                    propertyList.Add("Affidavit is inactive or has a permit");
                }
            }
        }

        private void txtPropertySearch_KeyUp(object sender, KeyEventArgs e)
        {
            SearchProperty();
            if (propertyList.Count > 0)
            {
                PropertySuggestionList.ItemsSource = null;
                PropertySuggestionList.ItemsSource = propertyList;
                PropertySuggestionList.Visibility = Visibility.Visible;
            }
            else if (txtPropertySearch.Text.Equals(""))
            {
                PropertySuggestionList.Visibility = Visibility.Collapsed;
                PropertySuggestionList.ItemsSource = null;
            }
            else
            {
                PropertySuggestionList.Visibility = Visibility.Collapsed;
                PropertySuggestionList.ItemsSource = null;
            }
        }

        //private void wbSample_Navigating(object sender, System.Windows.Navigation.NavigatingCancelEventArgs e)
        //{
        //    wbSample.Navigate("http:\\pdotfile1\\apps\\SidewalkPosting\\Documents\\App\\Graphics\\PermitAcceptanceText.svg");
        //}

        private void rdoAffidavit_Checked(object sender, RoutedEventArgs e)
        {
            txtAffidavitSearch.Text = string.Empty;
            txtAffidavitSearch.IsEnabled = true;
            txtPropertySearch.Text = string.Empty;
            txtPropertySearch.IsEnabled = false;
        }

        private void rdoAddress_Checked(object sender, RoutedEventArgs e)
        {
            txtPropertySearch.Text = string.Empty;
            txtPropertySearch.IsEnabled = true;
            txtAffidavitSearch.Text = string.Empty;
            txtAffidavitSearch.IsEnabled = false;
        }

    }
}